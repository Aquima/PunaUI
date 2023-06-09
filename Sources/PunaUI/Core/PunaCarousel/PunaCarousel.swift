//
//  PunaCarousel.swift
//  PunaUI
//
//  Created by Raul Quispe on 29/03/2021.
//

import UIKit

@objc public class PunaCarousel: UIView {

    private var contentView: PunaCarouselView!

    @objc public weak var delegate: PunaCarouselDelegate?
    /// Set the dataSource to use own methods
    @objc public weak var dataSource: PunaCarouselDataSource? {
        didSet {
            self.updateContentView()
        }
    }
    @objc public var margin: PunaCarouselMargin = .defaultMargin {
        didSet {
            self.reDrawContentViewIfNeededThenUpdate()
        }
    }
    @objc public var mode: PunaCarouselMode = .free {
        didSet {
            self.updateContentView()
        }
    }

    @IBInspectable public var title: String? {
        didSet {
            self.updateContentView()
        }
    }

    @IBInspectable public var usePaginator: Bool = false {
        didSet {
            self.updateContentView()
        }
    }

    @objc public init(title: String = String(), margin: PunaCarouselMargin = .defaultMargin, mode: PunaCarouselMode = .free, usePaginator: Bool = false, delegate: PunaCarouselDelegate? = nil) {
        self.title = title
        self.margin = margin
        self.mode = mode
        self.usePaginator = usePaginator
        self.delegate = delegate
        super.init(frame: .zero)
        setup()
    }
    /**
     Constructor for the Carousel when it is used by interface builder
     By defect, it will be .icon and .default
     */
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        let contentView = provideContentView()
        drawContentView(with: contentView)
    }

    private func drawContentView(with contentView: PunaCarouselView) {
        self.contentView = contentView
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.pinToSuperview()
    }

    private func provideContentView() -> PunaCarouselView {
        let config = PunaCarouselViewConfigFactory.provide(for: self)
        return PunaCarouselTypeCardViewFactory.provide(for: config, view: self)
    }

    private func updateContentView() {
        let config = PunaCarouselViewConfigFactory.provide(for: self)
        contentView.update(withConfig: config)
    }

    /// Check if view needs to be redrawn, and then update it. This method should be called on all modifiers that may need to change which internal view should be rendered
    private func reDrawContentViewIfNeededThenUpdate() {
        let newView = provideContentView()
        if Swift.type(of: newView) !== Swift.type(of: contentView) {
            contentView.removeFromSuperview()
            drawContentView(with: newView)
        } else {
            updateContentView()
        }
    }
}

// MARK: - IB interface
public extension PunaCarousel {
    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'margin' instead.")
    @IBInspectable var ibMargin: String {
        set(val) {
            self.margin = PunaCarouselMargin.checkValidEnum(property: "IB margin", key: val)
        }
        get {
            return self.margin.toString()
        }
    }

    @available(*, unavailable, message: "This property is reserved for Interface Builder. Use 'mode' instead.")
    @IBInspectable var ibMode: String {
        set(val) {
            self.mode = PunaCarouselMode.checkValidEnum(property: "IB mode", key: val)
        }
        get {
            return self.mode.toString()
        }
    }
}

extension PunaCarousel: PunaCarouselViewProtocol {

    func cellForRowAt(indexPath: IndexPath) -> UIView {
        return (dataSource?.PunaCarousel(self, cellForRowAt: indexPath)) ?? UIView()
    }

    func numberOfRow() -> Int {
        return dataSource?.getDataSetSize(self) ?? 0
    }

    func didSelectItemAt(indexPath: IndexPath) {
        delegate?.PunaCarousel(self, didSelectItemAt: indexPath)
    }

    func sizeForItemAt(indexPath: IndexPath) -> CGSize {
        delegate?.PunaCarousel?(self, sizeForItemAt: indexPath) ?? CGSize.zero
    }
}
