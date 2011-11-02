//
//  AccessExternalAPIiOSViewController.m
//  AccessExternalAPIiOS
//
//  Created by Ben Hall on 11/01/11.
//  Copyright 2011 Ben Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AccessExternalAPIiOSViewController.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"
#import "UITableViewTweetCell.h"

@implementation AccessExternalAPIiOSViewController

@synthesize tweets;

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSLog(@"numberOfSectionsInTableView");
	return 1;
}

-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"numberOfRowsInSection");
 	return [tweets count];
 }

 -(UITableViewTweetCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cellForRowAtIndexPath");
     NSString *uniqueIdentifier = @"customCell";
     UITableViewTweetCell  *cell = nil;
     cell = (UITableViewTweetCell *) [_tweetList dequeueReusableCellWithIdentifier:uniqueIdentifier];

     if(!cell)
      {

          NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"UITableViewTweetCell" owner:nil options:nil];

          for(id currentObject in topLevelObjects)
          {
              if([currentObject isKindOfClass:[UITableViewTweetCell class]])
              {
                  cell = (UITableViewTweetCell *)currentObject;
                  break;
              }
          }
      }

    NSString *text = [[tweets objectAtIndex:indexPath.row] objectForKey:@"text"];
    cell.msg.text = text;


 	return cell;
 }

- (IBAction)grabURLInBackground {
    NSLog(@"Making web request...");
    NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1/statuses/user_timeline.json?include_entities=false&include_rts=false&screen_name=ben_hall&count=5"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    [request setDelegate:self];
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    NSLog(@"Got web request");
    NSString *responseString = [request responseString];
    NSArray *deserializedData = [responseString objectFromJSONString];
    tweets = [deserializedData copy];
    [_tweetList reloadData];
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    NSError *error = [request error];
    NSLog(error.description);
}

- (void) loadTweets {
   NSLog(@"Loading Tweets...");
    
   [self grabURLInBackground];
}

//NSDictionary *deserializedData = [jsonString objectFromJSONString];
//NSArray *resultList = [deserializedData objectForKey:@"ResultList"];

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadTweets];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [tweets release];
    [super dealloc];
}

@end
