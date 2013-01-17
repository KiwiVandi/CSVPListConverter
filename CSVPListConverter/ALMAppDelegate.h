//
//  ALMAppDelegate.h
//  CSVPListConverter
//
//  Created by Dave van Dugteren on 17/01/13.
//  Copyright (c) 2013 Alive Mobile Pty Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ALMAppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (assign) IBOutlet NSTextField *txtFieldMain;

- (IBAction) selectorConvert:(id)sender;

@end
