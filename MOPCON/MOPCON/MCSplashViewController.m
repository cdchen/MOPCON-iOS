//
//  MCSplashViewController.m
//  MOPCON
//
//  Created by Cd Chen on 13/6/16.
//  Copyright (c) 2013年 MOPCON. All rights reserved.
//

#import "MCSplashViewController.h"
#import "MCMainViewController.h"
#import "MCAgendaViewController.h"
#import "MCTrafficGuideViewController.h"
#import "MCInfoViewController.h"

@interface MCSplashViewController ()

@end

@implementation MCSplashViewController


-(void)_loadingFinished
{
    [self->_activityIndicatorView stopAnimating];

    MCAgendaViewController *agendaViewController = [[MCAgendaViewController alloc] initWithNibName:@"MCAgendaViewController" bundle:nil];
    agendaViewController.title = NSLocalizedString(@"Agenda", nil);
    agendaViewController.tabBarItem.image = [UIImage imageNamed:@"glyphicons_045_calendar"];

    MCTrafficGuideViewController *trafficGuideViewController = [[MCTrafficGuideViewController alloc] initWithNibName:@"MCTrafficGuideViewController" bundle:nil];
    trafficGuideViewController.title = NSLocalizedString(@"Traffic", nil);
    trafficGuideViewController.tabBarItem.image = [UIImage imageNamed:@"glyphicons_026_road"];
    
    MCInfoViewController *infoViewController = [[MCInfoViewController alloc] initWithNibName:@"MCInfoViewController" bundle:nil];
    infoViewController.title = NSLocalizedString(@"Info", nil);
    infoViewController.tabBarItem.image = [UIImage imageNamed:@"glyphicons_195_circle_info"];
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    [viewControllers addObject:agendaViewController];
    [viewControllers addObject:trafficGuideViewController];
    [viewControllers addObject:infoViewController];
    
    MCMainViewController *mainViewController = [[MCMainViewController alloc] initWithNibName:@"MCMainViewController" bundle:nil];
    mainViewController.viewControllers = viewControllers;

    [self presentModalViewController:mainViewController animated:YES];
}

-(void)_loadingStart
{
    
    
    [self performSelectorOnMainThread:@selector(_loadingFinished) withObject:nil waitUntilDone:NO];
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    self->_activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self->_activityIndicatorView startAnimating];

    [self performSelectorInBackground:@selector(_loadingStart) withObject:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
