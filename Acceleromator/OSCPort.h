//
//  OSCPort.h
//  ObjCOSC
//
//  Created by C. Ramakrishnan on Tue Oct 01 2002.
//  Copyright (c) 2002 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSC-Client/OSC-client.h"

@interface OSCPort : NSObject {
    int		_sock;
    char*	_types;
    OSCbuf* 	_oscBuffer;
}

#pragma mark _____ instance creation
// ipAddress is a character string representing a numeric address in the standard
// Internet . notation. *I don't do name lookup*
+ (id)oscPortToAddress:(const char*)ipAddress portNumber:(short)portNumber;

// socket needs to be a socket connected to the server
- (id)initWithSocket:(int)socket;

#pragma mark _____ actions
// If you use a single OSCPort in multiple threads, you need
// an NSLock/mutex around calls to these actions
- (BOOL)loadSynthDef:(char*)synthDefFilename;
- (BOOL)newSynthFromDef:(char*)synthDefName 
                synthID:(int)synthID 
            parentGroup:(int)parentGroup;
- (BOOL)freeSynth:(int)synthID;

- (BOOL)sendTo:(char*)address types:(char*)types, ...;

@end
