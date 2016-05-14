//
//  TextGenerator.swift
//  
//  Random text generator static class
//
//  Created by C Rus on 12/05/16.
//  Copyright © 2016 crus. All rights reserved.
//

import Foundation

class TextGenerator {
    
    // words db taken from https://github.com/lukaskubanek/LoremSwiftum
    private static let allWords = "alias consequatur aut perferendis sit voluptatem accusantium doloremque aperiam eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo aspernatur aut odit aut fugit sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt neque dolorem ipsum quia dolor sit amet consectetur adipisci velit sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem ut enim ad minima veniam quis nostrum exercitationem ullam corporis nemo enim ipsam voluptatem quia voluptas sit suscipit laboriosam nisi ut aliquid ex ea commodi consequatur quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae et iusto odio dignissimos ducimus qui blanditiis praesentium laudantium totam rem voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident sed ut perspiciatis unde omnis iste natus error similique sunt in culpa qui officia deserunt mollitia animi id est laborum et dolorum fuga et harum quidem rerum facilis est et expedita distinctio nam libero tempore cum soluta nobis est eligendi optio cumque nihil impedit quo porro quisquam est qui minus id quod maxime placeat facere possimus omnis voluptas assumenda est omnis dolor repellendus temporibus autem quibusdam et aut consequatur vel illum qui dolorem eum fugiat quo voluptas nulla pariatur at vero eos et accusamus officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae itaque earum rerum hic tenetur a sapiente delectus ut aut reiciendis voluptatibus maiores doloribus asperiores repellat".componentsSeparatedByString(" ")
    
    // Static function to generate text with <count> number of characters
    static func getRandomText(count: Int) -> String {
        
        var generatedString = ""
        while generatedString.characters.count < count {
            
            let word = allWords[Int(arc4random_uniform(UInt32(allWords.count)))]
            generatedString += word
            generatedString += " "
            
        }
        
        // Capitalize first word of the generated text
        let firstChar = String(generatedString.characters.first!)
        generatedString = firstChar.uppercaseString + String(generatedString.characters.dropFirst())
        
        // Trim the text to have <count> characters
        if generatedString.characters.count > count {
            
            generatedString = String(generatedString.characters.dropLast(generatedString.characters.count - count))
            
        }
        
        return generatedString
    }
    
    
    
}
