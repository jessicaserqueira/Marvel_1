// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Detalhes do personagem
  internal static let detailsCharacter = L10n.tr("Localizable", "DetailsCharacter", fallback: "Detalhes do personagem")
  /// Detalhes da HQ
  internal static let detailsHQ = L10n.tr("Localizable", "DetailsHQ", fallback: "Detalhes da HQ")
  /// Você ainda não selecionou um personagem favorito
  internal static let notSelected = L10n.tr("Localizable", "NotSelected", fallback: "Você ainda não selecionou um personagem favorito")
  internal enum Characters {
    /// Localizable.strings
    ///   Marvel
    /// 
    ///   Created by NMAS Amaral on 18/01/23.
    internal static let title = L10n.tr("Localizable", "Characters.tile", fallback: "Personagens")
  }
  internal enum Favorites {
    /// Favoritos
    internal static let title = L10n.tr("Localizable", "Favorites.title", fallback: "Favoritos")
  }
  internal enum FindComic {
    internal enum Search {
      /// Encontre o seu quadrinho
      internal static let placeHolder = L10n.tr("Localizable", "FindComic.Search.placeHolder", fallback: "Encontre o seu quadrinho")
    }
  }
  internal enum FindFavorites {
    internal enum Search {
      /// Filtrar pelo nome do personagem
      internal static let placeHolder = L10n.tr("Localizable", "FindFavorites.Search.placeHolder", fallback: "Filtrar pelo nome do personagem")
    }
  }
  internal enum FindHQName {
    internal enum Search {
      /// Filtrar pelo nome da HQ
      internal static let placeHolder = L10n.tr("Localizable", "FindHQName.Search.placeHolder", fallback: "Filtrar pelo nome da HQ")
    }
  }
  internal enum Hq {
    /// HQ's
    internal static let title = L10n.tr("Localizable", "Hq.title", fallback: "HQ's")
  }
  internal enum MarvelHQ {
    /// Marvel HQ
    internal static let title = L10n.tr("Localizable", "MarvelHQ.title", fallback: "Marvel HQ")
  }
  internal enum NotFoundFavorite {
    /// Nenhum resultado encontrado
    internal static let text = L10n.tr("Localizable", "NotFoundFavorite.text", fallback: "Nenhum resultado encontrado")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

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
