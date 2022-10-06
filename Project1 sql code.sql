/*issue 1*/
checkpoint
dbcc dropcleanbuffers

 select DisplayName
 From users
 where CreationDate = '2008-09-15' and
 Userlocation='Athens, Greece'

create index idx_location ON users(UserLocation)
drop index idx_location on users

create index idx_location ON users(UserLocation, CreationDate) include(DisplayName)
drop index idx_location on users

/*issue  2*/


checkpoint
dbcc dropcleanbuffers

select title, body, score, ViewCount
 from Posts, PostTags, Tags
 where Posts.postid=PostTags.postid and
 PostTags.tagid=tags.tagid and tagname = 'Informix'

create index idx_TagId on PostTags(TagId)
create index idx_TagName on Tags(TagName)

select title, body, score, ViewCount
 from Posts, PostTags, Tags
 where Posts.postid=PostTags.postid and
 PostTags.tagid=tags.tagid and tagname = 'SQL'


drop index idx_TagId on PostTags
drop index idx_TagName on Tags

 /* issue 3 */
select userid, DisplayName
 from Users
 where userid in	( Select OwnerUserId from Posts where Score<0  )


select distinct userid, DisplayName 
 from Users, Posts 
 where Posts.OwnerUserId= userid and Score<0

create index idx_score on Posts(Score) include (OwnerUserId)
drop index idx_score on Posts

/*issue 4 */
Select Title, DisplayName
from Users, Posts
where  PostTypeId in (select PostTypeId from PostTypes where PostTypeName='Question')
and UserId= OwnerUserId and Posts.CreationDate='2010-09-11'

create index idx_tName on PostTypes(PostTypeName)
drop index idx_tName on PostTypes
create index idx_CD on Posts(CreationDate) include (OwnerUserId)
drop Index idx_CD on Posts



set statistics io on
set statistics time on

checkpoint
dbcc dropcleanbuffers

Select DisplayName, Score, text, Count(BName) as NumOfBadges
from Users, Comments, Badges
where Users.UserId = Comments.UserId
and score > 500 and Badges.UserId=Users.UserId
group by DisplayName, Score, text

create index idx on Comments(Score) include( userid)
drop index idx on Comments

/*issue 5*/
select distinct right(Users.UserLocation,
charindex(',', reverse(Users.UserLocation) + ',') - 1) from users where UserLocation like '%Greece'
 
 checkpoint 
 dbcc dropcleanbuffers

 ALTER TABLE users
ADD UserLocationWide NVARCHAR(100);
Update Users Set Users.UserLocationWide= right(Users.UserLocation,
charindex(',', reverse(Users.UserLocation) + ',') - 1)


select displayName, userlocation
 from users where userlocationwide = 'Greece'

 create index idx_country on Users(UserLocationWide) include (displayName)

 drop index idx_country on Users
 alter table Users
 drop column UserLocationWide
