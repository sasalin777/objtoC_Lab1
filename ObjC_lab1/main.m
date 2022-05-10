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
    // printf("Input a string: ");
    NSLog(@"%@", prompt);
    fgets(inputChars, 255, stdin);
    // printf("Your imputer is: %s\n", inputChars);
    // covert char array (c string) to a NSString object
    return [NSString stringWithUTF8String:inputChars];
    //NSLog(@"Input was : %@",inputString);
}

int main(int argc, const char * argv[]) {
restartprogram:
    @autoreleasepool {
    
    NSString *inputString = getUserInput(@"\nEnter your String:('q' to quit) ");
        if ([inputString  isEqual: @"q\n"]) {
           // goto outer_done;
          userBreak;

        } else if ([inputString  isEqual: @"\n"]) {
            goto restartprogram;
        }
        else {
        KeepGoing:
        NSLog(@"\nChoose one of the following options:\n1. Uppercase\n2. Lowercase\n3. Numberize\n4. Canadianize\n5. Respond\n6. Do-Space-It\n7. Word count\n8. Remove Punctuation\n9. Done ");
            int inputInt;
            scanf("%i", &inputInt);
            //NSLog(@"%d",inputInt);
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
                    NSLog(@"%@,eh?",inputString);
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
                    
                    
                    goto KeepGoing;
                }
                    
                case 8: {
                   // NSString *str = inputString;
                    //NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"@／：()；（）¥「」＂、[]{}#%-*+=_\\|~＜＞$€^•'@#$%^&*()_+'\""];
                    //NSString *trimmedString = [inputString stringByTrimmingCharactersInSet:set];
//                    NSString *newStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//
//                    NSString *trimmedString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet punctuationCharacterSet]];
//                    NSLog(@"%@",newStr);
//                    NSString *str = inputString;
//                    NSString *newStr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//                    NSLog(@"处理之前|%@|, 处理之后|%@|", str, newStr);
                    goto KeepGoing;
                }
                    
                case 9: {
                    NSLog(@"Next String!");
                    inputString = @"";
                    goto restartprogram;
                }
            }
      //  goto inputIntArea;
        }
   // outer_done: printf("out!");
//        printf("Your string is %s\n", inputChars);
//        NSString *inputString = [NSString stringWithUTF8String:inputChars];
//        NSLog(@"Input was: %@", inputString);
  //      inputIntArea:
        
       // switch (
    }
    return 0;
}
