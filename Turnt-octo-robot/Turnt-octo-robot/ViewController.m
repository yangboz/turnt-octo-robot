//
//  ViewController.m
//  AddressBookSample00
//
//  Created by zhou Yangbo on 13-5-26.
//  Copyright (c) 2013年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize firstName,phoneNumber,imageView;


- (IBAction)showPicker:(id)sender 
{
    ABPeoplePickerNavigationController *picker = [[ABPeoplePickerNavigationController alloc] init];
    picker.peoplePickerDelegate = self;
    
    [self presentModalViewController:picker animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

//Delegate impl
-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    [self dismissModalViewControllerAnimated:YES];
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
    [self displayPerson:person];
    [self dismissModalViewControllerAnimated:YES];
    return NO;
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    return NO;
}

//Display 
-(void) displayPerson:(ABRecordRef)person
{
    //first name
    NSString *name = (__bridge_transfer NSString*)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    self.firstName.text = name;
    //phone number
    NSString *phone = NULL;
    ABMultiValueRef phoneNumbers = ABRecordCopyValue(person, kABPersonPhoneProperty);
    
    if (ABMultiValueGetCount(phoneNumbers)>0) {
        phone = (__bridge_transfer NSString*)ABMultiValueCopyValueAtIndex(phoneNumbers, 0);
    }else {
        phone = @"(NONE)";
    }
    self.phoneNumber.text = phone;
    //image view
    if (ABPersonHasImageData(person)) {
        self.imageView.image = [UIImage imageWithData:(NSData *)ABPersonCopyImageData(person)];
    }
    //CFRelease
    CFRelease(phoneNumbers);
}

@end
