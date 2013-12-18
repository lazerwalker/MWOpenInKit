//
//  INKTwitterHandler.m
//  INKOpenInKitDemo
//
//  Created by Michael Walker on 12/3/13.
//  Copyright (c) 2013 Mike Walker. All rights reserved.
//

#import "INKTwitterHandler.h"

<<<<<<< HEAD:IntentKit/Handlers/INKTwitterHandler.m
@implementation INKTwitterHandler
=======
@implementation MWTwitterHandler
@synthesize fallback;

- (id)init {
    self = [super init];
    if (self) {
        [self setFallback:NO];
    }

    return self;
}
>>>>>>> 6fa0d1a... Squashed commit of the following::MWOpenInKit/Handlers/MWTwitterHandler.m

- (INKActivityPresenter *)showTweetWithId:(NSString *)tweetId {
    NSDictionary *args = [self argumentsDictionaryWithArguments:@{@"tweetId": tweetId}];
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:args
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)showUserWithScreenName:(NSString *)screenName {
    NSDictionary *args = [self argumentsDictionaryWithArguments:@{@"screenName": screenName}];
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:args
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)showUserWithId:(NSString *)userId {
    NSDictionary *args = [self argumentsDictionaryWithArguments:@{@"userId": userId}];
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:args
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)showTimeline {
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:[self argumentsDictionaryWithArguments:nil]
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)showMentions {
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:[self argumentsDictionaryWithArguments:nil]
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)showDirectMessages {
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:[self argumentsDictionaryWithArguments:nil]
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)searchFor:(NSString *)query {
    NSDictionary *arguments = [self argumentsDictionaryWithArguments:
                               @{@"query": urlEncode(query)}];

    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:arguments
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)tweetMessage:(NSString *)message {
    NSDictionary *arguments = [self argumentsDictionaryWithArguments:
                               @{@"message": urlEncode(message)}];
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:arguments
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)tweetMessage:(NSString *)message inReplyTo:(NSString *)replyId {
    NSDictionary *arguments = [self argumentsDictionaryWithArguments:
                               @{@"message": urlEncode(message),
                                 @"replyId": replyId}];
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:arguments
                  fallback:[self fallback]];
}

#pragma mark - Actions not supported by all clients
- (INKActivityPresenter *)showRetweets {
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:[self argumentsDictionaryWithArguments:nil]
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)showFavorites {
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:[self argumentsDictionaryWithArguments:nil]
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)showLists {
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:[self argumentsDictionaryWithArguments:nil]
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)showListWithId:(NSString *)listId {
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:[self argumentsDictionaryWithArguments:NSDictionaryOfVariableBindings(listId)]
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)tweetSearchPage {
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:[self argumentsDictionaryWithArguments:nil]
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)followUser:(NSString *)user {
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:[self argumentsDictionaryWithArguments:NSDictionaryOfVariableBindings(user)]
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)unfollowUser:(NSString *)user {
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:[self argumentsDictionaryWithArguments:NSDictionaryOfVariableBindings(user)]
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)favoriteTweetWithId:(NSString *)tweetId {
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:[self argumentsDictionaryWithArguments:NSDictionaryOfVariableBindings(tweetId)]
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)unfavoriteTweetWithId:(NSString *)tweetId {
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:[self argumentsDictionaryWithArguments:NSDictionaryOfVariableBindings(tweetId)]
                  fallback:[self fallback]];
}

- (INKActivityPresenter *)retweetTweetWithId:(NSString *)tweetId {
    return [self performCommand:NSStringFromSelector(_cmd)
                  withArguments:[self argumentsDictionaryWithArguments:NSDictionaryOfVariableBindings(tweetId)]
                  fallback:[self fallback]];
}

#pragma mark - Private methods
- (NSDictionary *)argumentsDictionaryWithArguments:(NSDictionary *)args {
    if (!args) {
        args = @{};
    }
    
    NSMutableDictionary *newArgs = [args mutableCopy];

    if (self.callbackURL) {
        newArgs[@"callbackURL"] = urlEncode(self.callbackURL.absoluteString);
    }

    if (self.activeUser) {
        newArgs[@"activeUser"] = self.activeUser;
    }

    if (!newArgs[@"activeUser"]) {
        newArgs[@"activeUser"] = @"";
    }

    return [newArgs copy];
}

@end
