//
//  NewsListEntity.swift
//  TheNewsCarlosCavalcanti
//
//  Created by Carlos Roberto Cavalcanti on 10/02/22.
//

import Foundation

typealias NewsModel = [NewsListEntity]

// MARK: - NewsModelElement
struct NewsListEntity: Codable {
    let content: [Conteudo]
    let product: String
    
    enum CodingKeys: String, CodingKey {
        case content = "conteudos"
        case product = "produto"
    }
}

// MARK: - Conteudo
struct Conteudo: Codable {
    let author: [String]?
    let comercialContent: Bool?
    let subTitle, text: String?
    let videos: [String]?
    let updateDate: String
    let id: Int
    let releaseDate: String
    let section: SectionModel
    let type: String
    let title: String
    let url, originalURL: String
    let images: [ImageModel]

    enum CodingKeys: String, CodingKey {
        case author = "autores"
        case comercialContent = "informePublicitario"
        case subTitle = "subTitulo"
        case text = "texto"
        case updateDate = "atualizadoEm"
        case releaseDate = "publicadoEm"
        case section = "secao"
        case type = "tipo"
        case title = "titulo"
        case originalURL = "urlOriginal"
        case images = "imagens"
        case id, url, videos
    }
}

// MARK: - Imagen
struct ImageModel: Codable {
    let author, source, subtitle: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case author = "autor"
        case source = "fonte"
        case subtitle = "legenda"
        case url
    }
}

// MARK: - Secao
struct SectionModel: Codable {
    let name: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name = "nome"
        case url
    }
}
