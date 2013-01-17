//
//  ALMAppDelegate.m
//  CSVPListConverter
//
//  Created by Dave van Dugteren on 17/01/13.
//  Copyright (c) 2013 Alive Mobile Pty Ltd. All rights reserved.
//

#import "ALMAppDelegate.h"
#import "parseCSV.h"

@implementation ALMAppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

}

- (IBAction) selectorConvert:(id)sender
{
  if (self.txtFieldMain.stringValue.length > 0) {
	NSString *pathAsString = self.txtFieldMain.stringValue;

	CSVParser *parser = [CSVParser new];
	[parser openFile: pathAsString];
	
	NSMutableArray *csvContent = [parser parseFile];
	[parser closeFile];
	
	if (pathAsString != nil)
	{
	  NSArray *keyArray = [csvContent objectAtIndex:0];
	  
	  NSMutableArray *plistOutputArray = [NSMutableArray array];
	  
	  NSInteger i = 0;
	  
	  for (NSArray *array in csvContent)
	  {
		NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
		
		NSInteger keyNumber = 0;
		
		for (NSString *string in array)
		{
		  if (keyArray.count > keyNumber) {
			[dictionary setObject:string forKey:[keyArray objectAtIndex:keyNumber]];
			
			keyNumber++;
			
			if (keyNumber == 8 && i == 19) {
			  NSLog(@"Crash time");
			}
			
			NSLog(@"%li - %li", i, keyNumber);
		  }
		  else{
			break;
		  }
		 
		}
		
		if (i > 0)
		{
		  [plistOutputArray addObject:dictionary];
		}
		
		i++;
		
	  }
	  
	  NSMutableString *mutableString = [NSMutableString stringWithString:pathAsString];
	  [mutableString replaceOccurrencesOfString:@".csv"
									 withString:@".plist"
										options: NSCaseInsensitiveSearch
										  range:NSMakeRange([mutableString length]-4, 4)];
	  
	  NSURL *url = [NSURL fileURLWithPath:mutableString];
	  
	  
	  [plistOutputArray writeToURL:url atomically:YES];
	}
  }
}

@end
