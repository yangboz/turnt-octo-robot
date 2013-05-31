//
//  ViewController.h
//  AddressBookSample00
//
//  Created by zhou Yangbo on 13-5-26.
//  Copyright (c) 2013年 GODPAPER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>

@interface ViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate,UIAlertViewDelegate>
{
    IBOutlet UILabel *_firstName;
    IBOutlet UILabel *_phoneNumber;
    IBOutlet UIImageView *_imageView;
    IBOutlet UIDatePicker *_datePicker;
    IBOutlet UISwitch *_timeSwicher;
    //Timer
    NSTimer *timer;
}
- (IBAction)showPicker:(id)sender;
@property(nonatomic,retain)IBOutlet UILabel *firstName;
@property(nonatomic,retain)IBOutlet UILabel *phoneNumber;
@property(nonatomic,retain)IBOutlet
UIImageView *imageView;
@property(nonatomic,retain)IBOutlet UIDatePicker *datePicker;
@property(nonatomic,retain)IBOutlet
UISwitch *timeSwicher;
- (IBAction)timeSwitcherChange:(id)sender;

@end
