//
//  SOItems.m
//
//  Created by Bradley Johnson on 7/30/14
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "SOItems.h"
#import "SOOwner.h"


NSString *const kSOItemsClosedReason = @"closed_reason";
NSString *const kSOItemsAnswerCount = @"answer_count";
NSString *const kSOItemsLastEditDate = @"last_edit_date";
NSString *const kSOItemsBountyAmount = @"bounty_amount";
NSString *const kSOItemsOwner = @"owner";
NSString *const kSOItemsLink = @"link";
NSString *const kSOItemsTags = @"tags";
NSString *const kSOItemsViewCount = @"view_count";
NSString *const kSOItemsCreationDate = @"creation_date";
NSString *const kSOItemsIsAnswered = @"is_answered";
NSString *const kSOItemsTitle = @"title";
NSString *const kSOItemsAcceptedAnswerId = @"accepted_answer_id";
NSString *const kSOItemsBountyClosesDate = @"bounty_closes_date";
NSString *const kSOItemsLastActivityDate = @"last_activity_date";
NSString *const kSOItemsQuestionId = @"question_id";
NSString *const kSOItemsScore = @"score";
NSString *const kSOItemsClosedDate = @"closed_date";


@interface SOItems ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation SOItems

@synthesize closedReason = _closedReason;
@synthesize answerCount = _answerCount;
@synthesize lastEditDate = _lastEditDate;
@synthesize bountyAmount = _bountyAmount;
@synthesize owner = _owner;
@synthesize link = _link;
@synthesize tags = _tags;
@synthesize viewCount = _viewCount;
@synthesize creationDate = _creationDate;
@synthesize isAnswered = _isAnswered;
@synthesize title = _title;
@synthesize acceptedAnswerId = _acceptedAnswerId;
@synthesize bountyClosesDate = _bountyClosesDate;
@synthesize lastActivityDate = _lastActivityDate;
@synthesize questionId = _questionId;
@synthesize score = _score;
@synthesize closedDate = _closedDate;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.closedReason = [self objectOrNilForKey:kSOItemsClosedReason fromDictionary:dict];
            self.answerCount = [[self objectOrNilForKey:kSOItemsAnswerCount fromDictionary:dict] doubleValue];
            self.lastEditDate = [[self objectOrNilForKey:kSOItemsLastEditDate fromDictionary:dict] doubleValue];
            self.bountyAmount = [[self objectOrNilForKey:kSOItemsBountyAmount fromDictionary:dict] doubleValue];
            self.owner = [SOOwner modelObjectWithDictionary:[dict objectForKey:kSOItemsOwner]];
            self.link = [self objectOrNilForKey:kSOItemsLink fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kSOItemsTags fromDictionary:dict];
            self.viewCount = [[self objectOrNilForKey:kSOItemsViewCount fromDictionary:dict] doubleValue];
            self.creationDate = [[self objectOrNilForKey:kSOItemsCreationDate fromDictionary:dict] doubleValue];
            self.isAnswered = [[self objectOrNilForKey:kSOItemsIsAnswered fromDictionary:dict] boolValue];
            self.title = [self objectOrNilForKey:kSOItemsTitle fromDictionary:dict];
            self.acceptedAnswerId = [[self objectOrNilForKey:kSOItemsAcceptedAnswerId fromDictionary:dict] doubleValue];
            self.bountyClosesDate = [[self objectOrNilForKey:kSOItemsBountyClosesDate fromDictionary:dict] doubleValue];
            self.lastActivityDate = [[self objectOrNilForKey:kSOItemsLastActivityDate fromDictionary:dict] doubleValue];
            self.questionId = [[self objectOrNilForKey:kSOItemsQuestionId fromDictionary:dict] doubleValue];
            self.score = [[self objectOrNilForKey:kSOItemsScore fromDictionary:dict] doubleValue];
            self.closedDate = [[self objectOrNilForKey:kSOItemsClosedDate fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.closedReason forKey:kSOItemsClosedReason];
    [mutableDict setValue:[NSNumber numberWithDouble:self.answerCount] forKey:kSOItemsAnswerCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastEditDate] forKey:kSOItemsLastEditDate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bountyAmount] forKey:kSOItemsBountyAmount];
    [mutableDict setValue:[self.owner dictionaryRepresentation] forKey:kSOItemsOwner];
    [mutableDict setValue:self.link forKey:kSOItemsLink];
    NSMutableArray *tempArrayForTags = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tags) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTags] forKey:kSOItemsTags];
    [mutableDict setValue:[NSNumber numberWithDouble:self.viewCount] forKey:kSOItemsViewCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.creationDate] forKey:kSOItemsCreationDate];
    [mutableDict setValue:[NSNumber numberWithBool:self.isAnswered] forKey:kSOItemsIsAnswered];
    [mutableDict setValue:self.title forKey:kSOItemsTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.acceptedAnswerId] forKey:kSOItemsAcceptedAnswerId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bountyClosesDate] forKey:kSOItemsBountyClosesDate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastActivityDate] forKey:kSOItemsLastActivityDate];
    [mutableDict setValue:[NSNumber numberWithDouble:self.questionId] forKey:kSOItemsQuestionId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.score] forKey:kSOItemsScore];
    [mutableDict setValue:[NSNumber numberWithDouble:self.closedDate] forKey:kSOItemsClosedDate];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.closedReason = [aDecoder decodeObjectForKey:kSOItemsClosedReason];
    self.answerCount = [aDecoder decodeDoubleForKey:kSOItemsAnswerCount];
    self.lastEditDate = [aDecoder decodeDoubleForKey:kSOItemsLastEditDate];
    self.bountyAmount = [aDecoder decodeDoubleForKey:kSOItemsBountyAmount];
    self.owner = [aDecoder decodeObjectForKey:kSOItemsOwner];
    self.link = [aDecoder decodeObjectForKey:kSOItemsLink];
    self.tags = [aDecoder decodeObjectForKey:kSOItemsTags];
    self.viewCount = [aDecoder decodeDoubleForKey:kSOItemsViewCount];
    self.creationDate = [aDecoder decodeDoubleForKey:kSOItemsCreationDate];
    self.isAnswered = [aDecoder decodeBoolForKey:kSOItemsIsAnswered];
    self.title = [aDecoder decodeObjectForKey:kSOItemsTitle];
    self.acceptedAnswerId = [aDecoder decodeDoubleForKey:kSOItemsAcceptedAnswerId];
    self.bountyClosesDate = [aDecoder decodeDoubleForKey:kSOItemsBountyClosesDate];
    self.lastActivityDate = [aDecoder decodeDoubleForKey:kSOItemsLastActivityDate];
    self.questionId = [aDecoder decodeDoubleForKey:kSOItemsQuestionId];
    self.score = [aDecoder decodeDoubleForKey:kSOItemsScore];
    self.closedDate = [aDecoder decodeDoubleForKey:kSOItemsClosedDate];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_closedReason forKey:kSOItemsClosedReason];
    [aCoder encodeDouble:_answerCount forKey:kSOItemsAnswerCount];
    [aCoder encodeDouble:_lastEditDate forKey:kSOItemsLastEditDate];
    [aCoder encodeDouble:_bountyAmount forKey:kSOItemsBountyAmount];
    [aCoder encodeObject:_owner forKey:kSOItemsOwner];
    [aCoder encodeObject:_link forKey:kSOItemsLink];
    [aCoder encodeObject:_tags forKey:kSOItemsTags];
    [aCoder encodeDouble:_viewCount forKey:kSOItemsViewCount];
    [aCoder encodeDouble:_creationDate forKey:kSOItemsCreationDate];
    [aCoder encodeBool:_isAnswered forKey:kSOItemsIsAnswered];
    [aCoder encodeObject:_title forKey:kSOItemsTitle];
    [aCoder encodeDouble:_acceptedAnswerId forKey:kSOItemsAcceptedAnswerId];
    [aCoder encodeDouble:_bountyClosesDate forKey:kSOItemsBountyClosesDate];
    [aCoder encodeDouble:_lastActivityDate forKey:kSOItemsLastActivityDate];
    [aCoder encodeDouble:_questionId forKey:kSOItemsQuestionId];
    [aCoder encodeDouble:_score forKey:kSOItemsScore];
    [aCoder encodeDouble:_closedDate forKey:kSOItemsClosedDate];
}

- (id)copyWithZone:(NSZone *)zone
{
    SOItems *copy = [[SOItems alloc] init];
    
    if (copy) {

        copy.closedReason = [self.closedReason copyWithZone:zone];
        copy.answerCount = self.answerCount;
        copy.lastEditDate = self.lastEditDate;
        copy.bountyAmount = self.bountyAmount;
        copy.owner = [self.owner copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.viewCount = self.viewCount;
        copy.creationDate = self.creationDate;
        copy.isAnswered = self.isAnswered;
        copy.title = [self.title copyWithZone:zone];
        copy.acceptedAnswerId = self.acceptedAnswerId;
        copy.bountyClosesDate = self.bountyClosesDate;
        copy.lastActivityDate = self.lastActivityDate;
        copy.questionId = self.questionId;
        copy.score = self.score;
        copy.closedDate = self.closedDate;
    }
    
    return copy;
}


@end
