# Sql-Query-Improvement
SQL project on indexes and methods to improve query completion time


The project was implemented on a small database-example from StackOverFlow- containing the following tables 
PostTypes(PostTypeId, PostTypeName)

VoteType(VoteTypeId, VoteTypeName)

Users(UserId, AboutMe, Creationdate,displayName, DownVotes,LastAccessDate, UserLocation, Repotation, UpVotes,ProfileViews, WebsiteUrl)

Badges(Bid,Bname,UserId,Bdate)

Posts(PostId, AcceptedAsnwerId,AnswerCount, Body, CommentCount,CreationDate,LastActivityDate, FavouriteCount,LastEditDate, LastEditiorDisplayName, OwnerUserId,ParentId,PostTypeId,Score,Title,ViewCount)

Comments(Cid,creationDate,PostId,RelatedPostId)

Tags(Tagid, TagName)

PostTags(PostId,Tagid)

Votes(VoiteId,PostID,UserId,BountyAmount,VoteTypeId,CreationDate)

