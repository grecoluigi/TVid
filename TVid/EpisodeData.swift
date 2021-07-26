//
//  EpisodeData.swift
//  EpisodeData
//
//  Created by Luigi on 25/07/21.
//

import Foundation
import ShazamKit

struct EpisodeData {
    var title: String
    var signatureFilename: String
    var episodeNumber: String
    var additionalInfo: String
    var thumbnailURLPath: String
}

extension SHMediaItemProperty {
    static let episodeInfo = SHMediaItemProperty("episodeInfo")
}

extension SHMediaItem {
    var episodeInfo: EpisodeData? {
        self[.episodeInfo] as? EpisodeData
    }
}

let episodes = [
    EpisodeData(
        title: "Una Pezza di Lundini",
        signatureFilename: "lundini 01-06-2021",
        episodeNumber: "Episodio del 01/06/2021",
        additionalInfo: "Ospiti il cantautore Samuele Bersani e il più forte tennista italiano, Matteo Berrettini, numero 9 della classifica Atp. Come ogni grande evento televisivo che si rispetti, non mancherà il \"Dopo Pezza\" condotto da Ema Stokholma e Gino Castaldo. \"Una pezza di Lundini\" è, anche, un programma di riparazione e di informazione catapultato in una dimensione a volte disturbante e surreale. Valerio Lundini incontra e parla con diversi ospiti. In studio con lui Emanuela Fanelli e la band dei Vazzanikki. Ogni puntata è diversamente bella.",
        thumbnailURLPath: "https://artworks.thetvdb.com/banners/series/388084/posters/5fe512c64ef02.jpg"
    ),
    EpisodeData(
        title: "Una Pezza di Lundini",
        signatureFilename: "lundini 04:05:2021",
        episodeNumber: "Episodio del 04/05/2021",
        additionalInfo: "Ospiti della puntata, Benedetta Parodi e il cantautore Cristian Bugatti, in arte Bugo. Ma \"Una pezza di Lundini\" è, anche, un programma di riparazione e di informazione catapultato in una dimensione a volte disturbante e surreale, in cui Valerio Lundini incontra e parla con diversi ospiti ed è accompagnato in studio da Emanuela Fanelli, che presenterà il nuovo promo della fiction \"Simonetta, la truccatrice della Magnani\" e dalla band dei Vazzanikki.",
        thumbnailURLPath: "https://artworks.thetvdb.com/banners/series/388084/posters/5fe512c64ef02.jpg"
    ),
    EpisodeData(
        title: "Una Pezza di Lundini",
        signatureFilename: "lundini 11:05:2021",
        episodeNumber: "Episodio del 11/05/2021",
        additionalInfo: "Frank Matano e il cantautore Ghemon ospiti della puntata. \"Una pezza di Lundini\" è anche un programma di informazione catapultato in una dimensione disturbante e surreale. Il conduttore \"inadeguato\" è Valerio Lundini, in studio con lui Emanuela Fanelli e la band dei Vazzanikki.",
        thumbnailURLPath: "https://artworks.thetvdb.com/banners/series/388084/posters/5fe512c64ef02.jpg"
    ),
    EpisodeData(
        title: "Big Little Lies",
        signatureFilename: "biglittlelies-s02e01",
        episodeNumber: "S02E01 What Have They Done?",
        additionalInfo: "Following first-day-of-school events, Madeline is worried by Bonnie’s behavior. Mary Louise, Celeste’s mother-in-law, offers her unvarnished assessment of Madeline’s character. Jane learns that she’s known in town as one of the “Monterey Five.”",
        thumbnailURLPath: "https://artworks.thetvdb.com/banners/seasons/5cffe05d340d7.jpg"),
    EpisodeData(
        title: "Chernobyl",
        signatureFilename: "chernobyl-s01e01",
        episodeNumber: "S01E01 1:23:45",
        additionalInfo: "Plant workers and firefighters put their lives on the line to control a catastrophic 1986 explosion at a Soviet nuclear power plant.",
        thumbnailURLPath: "https://artworks.thetvdb.com/banners/posters/5cc12861c93e4.jpg"),
    EpisodeData(
        title: "The Undoing",
        signatureFilename: "theundoing-s01e01",
        episodeNumber: "S01E01 The Undoing",
        additionalInfo: "Grace Fraser becomes intrigued by a young mother at her son's school. News of a tragedy rocks the school community.",
        thumbnailURLPath: "https://artworks.thetvdb.com/banners/series/369307/posters/5fa360bfbe810.jpg"),
    EpisodeData(
        title: "Twin Peaks",
        signatureFilename: "twinpeaks-s01e01",
        episodeNumber: "S01E01 Northwest Passage",
        additionalInfo: "The small northwest town of Twin Peaks, Washington is shaken up when the body of the Homecoming Queen, Laura Palmer, is discovered washed up on a riverbank, wrapped in plastic. Meanwhile, the rebellious Audrey Horne ruins a business deal for her father Benjamin.",
        thumbnailURLPath: "https://artworks.thetvdb.com/banners/seasons/70533-1-3.jpg")
]
