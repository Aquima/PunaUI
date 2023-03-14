// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif
#if canImport(SwiftUI)
  import SwiftUI
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
public typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
public enum PunaUIAssets {
  public static let punaControlYAccionBuscar16 = ImageAsset(name: "Puna_control_y_accion_buscar_16")
  public static let punaControlYAccionBuscar20 = ImageAsset(name: "Puna_control_y_accion_buscar_20")
  public static let punaControlYAccionBuscar24 = ImageAsset(name: "Puna_control_y_accion_buscar_24")
  public static let punaEnvioEnvio24 = ImageAsset(name: "Puna_envio_envio_24")
  public static let punaNavegacionAjustes = ImageAsset(name: "Puna_navegacion_ajustes")
  public static let punaNavegacionBuscar24 = ImageAsset(name: "Puna_navegacion_buscar_24")
  public static let punaNavegacionCarritoIdle24 = ImageAsset(name: "Puna_navegacion_carrito_idle_24")
  public static let punaNavegacionCategorias24 = ImageAsset(name: "Puna_navegacion_categorias_24")
  public static let punaNavegacionCompras24 = ImageAsset(name: "Puna_navegacion_compras_24")
  public static let punaNavegacionFavoritos24 = ImageAsset(name: "Puna_navegacion_favoritos_24")
  public static let punaNavegacionHistorial24 = ImageAsset(name: "Puna_navegacion_historial_24")
  public static let punaNavegacionInicio24 = ImageAsset(name: "Puna_navegacion_inicio_24")
  public static let punaNavegacionInmuebles24 = ImageAsset(name: "Puna_navegacion_inmuebles_24")
  public static let punaNavegacionMercadoPuntos24 = ImageAsset(name: "Puna_navegacion_mercado_puntos_24")
  public static let punaNavegacionNotificaciones24 = ImageAsset(name: "Puna_navegacion_notificaciones_24")
  public static let punaNavegacionOfertas24 = ImageAsset(name: "Puna_navegacion_ofertas_24")
  public static let punaNavegacionPortalDeAyuda24 = ImageAsset(name: "Puna_navegacion_portal_de_ayuda_24")
  public static let punaNavegacionSupermercado24 = ImageAsset(name: "Puna_navegacion_supermercado_24")
  public static let punaNavegacionTiendasOficiales24 = ImageAsset(name: "Puna_navegacion_tiendas_oficiales_24")
  public static let punaNavegacionVehiculos24 = ImageAsset(name: "Puna_navegacion_vehiculos_24")
  public static let punaNavegacionVentas24 = ImageAsset(name: "Puna_navegacion_ventas_24")
  public static let punaOtrosAlmanaque20 = ImageAsset(name: "Puna_otros_almanaque_20")
  public static let punaOtrosAlmanaque24 = ImageAsset(name: "Puna_otros_almanaque_24")
  public static let punaPagarYCobrarBilletera24 = ImageAsset(name: "Puna_pagar_y_cobrar_billetera_24")
  public static let punaPagarYCobrarEfectivo20 = ImageAsset(name: "Puna_pagar_y_cobrar_efectivo_20")
  public static let punaPagarYCobrarEfectivo24 = ImageAsset(name: "Puna_pagar_y_cobrar_efectivo_24")
  public static let punaPagarYCobrarFacturacion20 = ImageAsset(name: "Puna_pagar_y_cobrar_facturacion_20")
  public static let punaPagarYCobrarFacturacion24 = ImageAsset(name: "Puna_pagar_y_cobrar_facturacion_24")
  public static let punaPagarYCobrarLinkDePago24 = ImageAsset(name: "Puna_pagar_y_cobrar_link_de_pago_24")
  public static let punaPagarYCobrarQr24 = ImageAsset(name: "Puna_pagar_y_cobrar_qr_24")
  public static let punaPagarYCobrarTarjetaDeCredito20 = ImageAsset(name: "Puna_pagar_y_cobrar_tarjeta_de_credito_20")
  public static let punaPagarYCobrarTarjetaDeCredito24 = ImageAsset(name: "Puna_pagar_y_cobrar_tarjeta_de_credito_24")
  public static let punaUiArrowDown16 = ImageAsset(name: "Puna_ui_arrow_down_16")
  public static let punaUiArrowDown20 = ImageAsset(name: "Puna_ui_arrow_down_20")
  public static let punaUiArrowDown24 = ImageAsset(name: "Puna_ui_arrow_down_24")
  public static let punaUiArrowDown32 = ImageAsset(name: "Puna_ui_arrow_down_32")
  public static let punaUiArrowLeft16 = ImageAsset(name: "Puna_ui_arrow_left_16")
  public static let punaUiArrowLeft20 = ImageAsset(name: "Puna_ui_arrow_left_20")
  public static let punaUiArrowLeft24 = ImageAsset(name: "Puna_ui_arrow_left_24")
  public static let punaUiArrowLeft32 = ImageAsset(name: "Puna_ui_arrow_left_32")
  public static let punaUiArrowRight16 = ImageAsset(name: "Puna_ui_arrow_right_16")
  public static let punaUiArrowRight20 = ImageAsset(name: "Puna_ui_arrow_right_20")
  public static let punaUiArrowRight24 = ImageAsset(name: "Puna_ui_arrow_right_24")
  public static let punaUiArrowRight32 = ImageAsset(name: "Puna_ui_arrow_right_32")
  public static let punaUiArrowUp16 = ImageAsset(name: "Puna_ui_arrow_up_16")
  public static let punaUiArrowUp20 = ImageAsset(name: "Puna_ui_arrow_up_20")
  public static let punaUiArrowUp24 = ImageAsset(name: "Puna_ui_arrow_up_24")
  public static let punaUiArrowUp32 = ImageAsset(name: "Puna_ui_arrow_up_32")
  public static let punaUiCharge24 = ImageAsset(name: "Puna_ui_charge_24")
  public static let punaUiChargePaymentLink24 = ImageAsset(name: "Puna_ui_charge_payment_link_24")
  public static let punaUiChargePointMla24 = ImageAsset(name: "Puna_ui_charge_point_mla_24")
  public static let punaUiChargePointMlb24 = ImageAsset(name: "Puna_ui_charge_point_mlb_24")
  public static let punaUiChargeQrCode24 = ImageAsset(name: "Puna_ui_charge_qr_code_24")
  public static let punaUiCheckboxUnknown16 = ImageAsset(name: "Puna_ui_checkbox_unknown_16")
  public static let punaUiChevronDown12 = ImageAsset(name: "Puna_ui_chevron_down_12")
  public static let punaUiChevronDown16 = ImageAsset(name: "Puna_ui_chevron_down_16")
  public static let punaUiChevronDown20 = ImageAsset(name: "Puna_ui_chevron_down_20")
  public static let punaUiChevronDown24 = ImageAsset(name: "Puna_ui_chevron_down_24")
  public static let punaUiChevronDown32 = ImageAsset(name: "Puna_ui_chevron_down_32")
  public static let punaUiChevronLeft12 = ImageAsset(name: "Puna_ui_chevron_left_12")
  public static let punaUiChevronLeft16 = ImageAsset(name: "Puna_ui_chevron_left_16")
  public static let punaUiChevronLeft20 = ImageAsset(name: "Puna_ui_chevron_left_20")
  public static let punaUiChevronLeft24 = ImageAsset(name: "Puna_ui_chevron_left_24")
  public static let punaUiChevronLeft32 = ImageAsset(name: "Puna_ui_chevron_left_32")
  public static let punaUiChevronRight12 = ImageAsset(name: "Puna_ui_chevron_right_12")
  public static let punaUiChevronRight16 = ImageAsset(name: "Puna_ui_chevron_right_16")
  public static let punaUiChevronRight20 = ImageAsset(name: "Puna_ui_chevron_right_20")
  public static let punaUiChevronRight24 = ImageAsset(name: "Puna_ui_chevron_right_24")
  public static let punaUiChevronRight32 = ImageAsset(name: "Puna_ui_chevron_right_32")
  public static let punaUiChevronUp12 = ImageAsset(name: "Puna_ui_chevron_up_12")
  public static let punaUiChevronUp16 = ImageAsset(name: "Puna_ui_chevron_up_16")
  public static let punaUiChevronUp20 = ImageAsset(name: "Puna_ui_chevron_up_20")
  public static let punaUiChevronUp24 = ImageAsset(name: "Puna_ui_chevron_up_24")
  public static let punaUiChevronUp32 = ImageAsset(name: "Puna_ui_chevron_up_32")
  public static let punaUiClose12 = ImageAsset(name: "Puna_ui_close_12")
  public static let punaUiClose16 = ImageAsset(name: "Puna_ui_close_16")
  public static let punaUiClose20 = ImageAsset(name: "Puna_ui_close_20")
  public static let punaUiClose24 = ImageAsset(name: "Puna_ui_close_24")
  public static let punaUiClose32 = ImageAsset(name: "Puna_ui_close_32")
  public static let punaUiDrawer16 = ImageAsset(name: "Puna_ui_drawer_16")
  public static let punaUiDrawer20 = ImageAsset(name: "Puna_ui_drawer_20")
  public static let punaUiDrawer24 = ImageAsset(name: "Puna_ui_drawer_24")
  public static let punaUiEmpty16 = ImageAsset(name: "Puna_ui_empty_16")
  public static let punaUiEmpty20 = ImageAsset(name: "Puna_ui_empty_20")
  public static let punaUiEmpty24 = ImageAsset(name: "Puna_ui_empty_24")
  public static let punaUiFallback16 = ImageAsset(name: "Puna_ui_fallback_16")
  public static let punaUiFallback20 = ImageAsset(name: "Puna_ui_fallback_20")
  public static let punaUiFallback24 = ImageAsset(name: "Puna_ui_fallback_24")
  public static let punaUiFallback32 = ImageAsset(name: "Puna_ui_fallback_32")
  public static let punaUiFallback48 = ImageAsset(name: "Puna_ui_fallback_48")
  public static let punaUiFeedbackError16 = ImageAsset(name: "Puna_ui_feedback_error_16")
  public static let punaUiFeedbackError24 = ImageAsset(name: "Puna_ui_feedback_error_24")
  public static let punaUiFeedbackError40 = ImageAsset(name: "Puna_ui_feedback_error_40")
  public static let punaUiFeedbackInfo16 = ImageAsset(name: "Puna_ui_feedback_info_16")
  public static let punaUiFeedbackInfo24 = ImageAsset(name: "Puna_ui_feedback_info_24")
  public static let punaUiFeedbackSuccess16 = ImageAsset(name: "Puna_ui_feedback_success_16")
  public static let punaUiFeedbackSuccess24 = ImageAsset(name: "Puna_ui_feedback_success_24")
  public static let punaUiFeedbackSuccess40 = ImageAsset(name: "Puna_ui_feedback_success_40")
  public static let punaUiFeedbackWarning16 = ImageAsset(name: "Puna_ui_feedback_warning_16")
  public static let punaUiFeedbackWarning24 = ImageAsset(name: "Puna_ui_feedback_warning_24")
  public static let punaUiFeedbackWarning40 = ImageAsset(name: "Puna_ui_feedback_warning_40")
  public static let punaUiHelper16 = ImageAsset(name: "Puna_ui_helper_16")
  public static let punaUiHelper20 = ImageAsset(name: "Puna_ui_helper_20")
  public static let punaUiHelper24 = ImageAsset(name: "Puna_ui_helper_24")
  public static let punaUiInfo16 = ImageAsset(name: "Puna_ui_info_16")
  public static let punaUiInfo20 = ImageAsset(name: "Puna_ui_info_20")
  public static let punaUiInfo24 = ImageAsset(name: "Puna_ui_info_24")
  public static let punaUiMail24 = ImageAsset(name: "Puna_ui_mail_24")
  public static let punaUiMenuOverflow16 = ImageAsset(name: "Puna_ui_menu_overflow_16")
  public static let punaUiMenuOverflow20 = ImageAsset(name: "Puna_ui_menu_overflow_20")
  public static let punaUiMenuOverflow24 = ImageAsset(name: "Puna_ui_menu_overflow_24")
  public static let punaUiMenuVertical16 = ImageAsset(name: "Puna_ui_menu_vertical_16")
  public static let punaUiMenuVertical20 = ImageAsset(name: "Puna_ui_menu_vertical_20")
  public static let punaUiMenuVertical24 = ImageAsset(name: "Puna_ui_menu_vertical_24")
  public static let punaUiMenuVerticalHalf16 = ImageAsset(name: "Puna_ui_menu_vertical_half_16")
  public static let punaUiMenuVerticalHalf20 = ImageAsset(name: "Puna_ui_menu_vertical_half_20")
  public static let punaUiMenuVerticalHalf24 = ImageAsset(name: "Puna_ui_menu_vertical_half_24")
  public static let punaUiPayment16 = ImageAsset(name: "Puna_ui_payment_16")
  public static let punaUiPayment20 = ImageAsset(name: "Puna_ui_payment_20")
  public static let punaUiPayment24 = ImageAsset(name: "Puna_ui_payment_24")
  public static let punaUiPlaceholderImagen16 = ImageAsset(name: "Puna_ui_placeholder_imagen_16")
  public static let punaUiPlaceholderImagen20 = ImageAsset(name: "Puna_ui_placeholder_imagen_20")
  public static let punaUiPlaceholderImagen24 = ImageAsset(name: "Puna_ui_placeholder_imagen_24")
  public static let punaUiPlaceholderImagen32 = ImageAsset(name: "Puna_ui_placeholder_imagen_32")
  public static let punaUiPlaceholderImagen48 = ImageAsset(name: "Puna_ui_placeholder_imagen_48")
  public static let punaUiQuestion20 = ImageAsset(name: "Puna_ui_question_20")
  public static let punaUiRefresh16 = ImageAsset(name: "Puna_ui_refresh_16")
  public static let punaUiRefresh20 = ImageAsset(name: "Puna_ui_refresh_20")
  public static let punaUiRefresh24 = ImageAsset(name: "Puna_ui_refresh_24")
  public static let punaUiRestar16 = ImageAsset(name: "Puna_ui_restar_16")
  public static let punaUiRestar20 = ImageAsset(name: "Puna_ui_restar_20")
  public static let punaUiRestar24 = ImageAsset(name: "Puna_ui_restar_24")
  public static let punaUiSelectedCheckbox16 = ImageAsset(name: "Puna_ui_selected_checkbox_16")
  public static let punaUiShape16 = ImageAsset(name: "Puna_ui_shape_16")
  public static let punaUiShape24 = ImageAsset(name: "Puna_ui_shape_24")
  public static let punaUiSumar16 = ImageAsset(name: "Puna_ui_sumar_16")
  public static let punaUiSumar20 = ImageAsset(name: "Puna_ui_sumar_20")
  public static let punaUiSumar24 = ImageAsset(name: "Puna_ui_sumar_24")
  public static let punaUiToAgree16 = ImageAsset(name: "Puna_ui_to_agree_16")
  public static let punaUiToAgree20 = ImageAsset(name: "Puna_ui_to_agree_20")
  public static let punaUiToAgree24 = ImageAsset(name: "Puna_ui_to_agree_24")
  public static let punaUiToAgree32 = ImageAsset(name: "Puna_ui_to_agree_32")
  public static let punaUiToAgree48 = ImageAsset(name: "Puna_ui_to_agree_48")
  public static let punaUiVisibilityOff16 = ImageAsset(name: "Puna_ui_visibility_off_16")
  public static let punaUiVisibilityOff20 = ImageAsset(name: "Puna_ui_visibility_off_20")
  public static let punaUiVisibilityOff24 = ImageAsset(name: "Puna_ui_visibility_off_24")
  public static let punaUiVisibilityOn16 = ImageAsset(name: "Puna_ui_visibility_on_16")
  public static let punaUiVisibilityOn20 = ImageAsset(name: "Puna_ui_visibility_on_20")
  public static let punaUiVisibilityOn24 = ImageAsset(name: "Puna_ui_visibility_on_24")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

public struct ImageAsset {
  public fileprivate(set) var name: String

  #if os(macOS)
  public typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  public typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  public var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  public func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif

  #if canImport(SwiftUI)
  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
  public var swiftUIImage: SwiftUI.Image {
    SwiftUI.Image(asset: self)
  }
  #endif
}

public extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

#if canImport(SwiftUI)
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public extension SwiftUI.Image {
  init(asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle)
  }

  init(asset: ImageAsset, label: Text) {
    let bundle = BundleToken.bundle
    self.init(asset.name, bundle: bundle, label: label)
  }

  init(decorative asset: ImageAsset) {
    let bundle = BundleToken.bundle
    self.init(decorative: asset.name, bundle: bundle)
  }
}
#endif

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
