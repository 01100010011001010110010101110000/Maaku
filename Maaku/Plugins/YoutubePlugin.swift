//
//  YoutubeVideoPlugin.swift
//  BB
//
//  Created by Kris Baker on 4/14/17.
//  Copyright © 2017 Kristopher Baker. All rights reserved.
//

/// Represents a youtube video plugin parser.
public struct YoutubePluginParser: PluginParser {
    
    /// The unique name for the parser.
    public let name = "youtubevideo"
    
    /// Parses the given text and returns a markdown plugin.
    ///
    /// - Parameters:
    ///     - text: The text to parse.
    ///
    /// - Returns:
    ///     - The plugin if parsing succeeded, nil otherwise.
    public func parse(text: String) -> Plugin? {
        guard let url = parseURL(text) else {
            return nil
        }
        
        return YoutubePlugin(url: url)
    }
    
    public init() {
        
    }
}

/// Represents a youtube video plugin.
public struct YoutubePlugin: Plugin {
    
    /// The plugin name.
    public static let pluginName: PluginName = "youtubevideo"
    
    /// The youtube video URL.
    public let url: URL
    
    public init(url: URL) {
        self.url = url
    }
}

