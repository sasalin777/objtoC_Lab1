//
//  main.m
//  ObjC_lab1
//
//  Created by Li Tzu Lin on 2022-05-09.
//

#import <Foundation/Foundation.h>

NSString *getUserInput(NSString *prompt) {
    
    // 1. array of chars
    char inputChars[255];
    NSLog(@"%@", prompt);
    fgets(inputChars, 255, stdin);
    // covert char array (c string) to a NSString object
    return [NSString stringWithUTF8String:inputChars];

}

int main(int argc, const char * argv[]) {
restartprogram:
    @autoreleasepool {
    
    NSString *inputString = getUserInput(@"\nEnter your String:('q' to quit) ");
        if ([inputString  isEqual: @"q\n"]) {
          userBreak;

        } else if ([inputString  isEqual: @"\n"]) {
            goto restartprogram;
        }
        else {
        KeepGoing:
        NSLog(@"\nChoose one of the following options:\n1. Uppercase\n2. Lowercase\n3. Numberize\n4. Canadianize\n5. Respond\n6. Do-Space-It\n7. Word count\n8. Remove Punctuation\n9. Done ");
            int inputInt;
            scanf("%i", &inputInt);
            switch (inputInt) {
                    
                case 1: {
                    NSString *inputUPPercase = [inputString uppercaseString];
                    NSLog(@"%@",inputUPPercase);
                    goto KeepGoing;
                }
                    
                case 2: {
                    NSString *inputLowercase = [inputString lowercaseString];
                    NSLog(@"%@",inputLowercase);
                    goto KeepGoing;
                }
                case 3: {
                    NSInteger *inputNum = [inputString integerValue];
                    if (inputNum != 0) {
                    NSLog(@"%d",inputNum);
                    goto KeepGoing;
                    
                    } else {
                        NSLog(@"Input Cannot Be Converted to Integer.");
                        goto KeepGoing;
                    }
                }
                
                case 4: {
                    
                    NSMutableString *str = inputString;
                    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
                    NSLog(@"%@,eh?",str);
                    goto KeepGoing;
                }
                
                case 5: {
                    
                    if ([inputString containsString:(@"?") ]) {
                        NSLog(@"I don't know");
                    } else if ([inputString containsString:(@"!")]) {
                        NSLog(@"Whoa, calm down!");
                    } else {
                        NSLog(@"%@",inputString);
                    }
                    goto KeepGoing;
                }
                
                case 6: {
                    NSMutableString *str = inputString;
                    if ([inputString containsString:(@" ")]) {
                     str = [str stringByReplacingOccurrencesOfString:@" "
                                                             withString:@"-"];
                        NSLog(@"%@",str);
                    } else {
                        NSLog(@"%@",inputString);
                    }
                    goto KeepGoing;
                }
                    
                case 7: {
                    
//                    int lenth = [inputString length]-1;
//                    NSLog(@"%d",lenth);
                    NSUInteger spaces = 0;
                    for (NSUInteger index = 0; index < [inputString length]; index++) {
                        if ([inputString characterAtIndex:index] == ' ' || [inputString characterAtIndex:index] == '-')   {
                            spaces++;
                        }
                    }
                    NSLog(@"%d",spaces+1);
                                       
                    goto KeepGoing;
                }
                    
                case 8: {
                    NSError *error = nil;
                    NSString *pattern = @"[^a-zA-Z0-9\u4e00-\u9fa5]";
                        NSRegularExpression *regularExpress = [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:&error];
                        NSString *string = [regularExpress stringByReplacingMatchesInString:inputString options:0 range:NSMakeRange(0, [inputString length]) withTemplate:@" "];
                   NSLog(@"%@",string);
                    goto KeepGoing;
                }
                    
                case 9: {
                    NSLog(@"Next String!");
                    inputString = @"";
                    goto restartprogram;
                }
                
                default: {
                    NSLog(@"Please input again!(1 - 9)!");
                    goto KeepGoing;
                }
            }
        }
 
    }
    return 0;
}
