// Protocol Buffers for Objective C
//
// Copyright 2010 Booyah Inc.
// Copyright 2008 Cyrus Najmabadi
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "AbstractMessage.h"

#import "CodedOutputStream.h"

@implementation BatPBAbstractMessage

- (id) init {
  if ((self = [super init])) {
  }

  return self;
}


- (NSData*) data {
  NSMutableData* data = [NSMutableData dataWithLength:self.serializedSize];
  BatPBCodedOutputStream* stream = [BatPBCodedOutputStream streamWithData:data];
  [self writeToCodedOutputStream:stream];
  return data;
}


- (BOOL) isInitialized {
  @throw [NSException exceptionWithName:@"ImproperSubclassing" reason:@"" userInfo:nil];
}


- (int32_t) serializedSize {
  @throw [NSException exceptionWithName:@"ImproperSubclassing" reason:@"" userInfo:nil];
}


- (void) writeToCodedOutputStream:(BatPBCodedOutputStream*) output {
  @throw [NSException exceptionWithName:@"ImproperSubclassing" reason:@"" userInfo:nil];
}


- (void) writeToOutputStream:(NSOutputStream*) output {
  BatPBCodedOutputStream* codedOutput = [BatPBCodedOutputStream streamWithOutputStream:output];
  [self writeToCodedOutputStream:codedOutput];
  [codedOutput flush];
}

- (void) writeDelimitedToOutputStream:(NSOutputStream *)output
{
    int serialized = [self serializedSize];
    BatPBCodedOutputStream* codedOutput = [BatPBCodedOutputStream streamWithOutputStream:output];
    [codedOutput writeRawVarint32:serialized];
    [self writeToCodedOutputStream:codedOutput];
    [codedOutput flush];
}

- (id<BatPBMessage>) defaultInstance {
  @throw [NSException exceptionWithName:@"ImproperSubclassing" reason:@"" userInfo:nil];
}


- (BatPBUnknownFieldSet*) unknownFields {
  @throw [NSException exceptionWithName:@"ImproperSubclassing" reason:@"" userInfo:nil];
}


- (id<BatPBMessage_Builder>) builder {
  @throw [NSException exceptionWithName:@"ImproperSubclassing" reason:@"" userInfo:nil];
}


- (id<BatPBMessage_Builder>) toBuilder {
  @throw [NSException exceptionWithName:@"ImproperSubclassing" reason:@"" userInfo:nil];
}


- (void) writeDescriptionTo:(NSMutableString*) output
                 withIndent:(NSString*) indent {
  @throw [NSException exceptionWithName:@"ImproperSubclassing" reason:@"" userInfo:nil];
}


- (NSString*) description {
  NSMutableString* output = [NSMutableString string];
  [self writeDescriptionTo:output withIndent:@""];
  return output;
}


@end
