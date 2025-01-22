create database socialMedia;

use socialMedia;

create table [user](
 userId int primary key,
 userName varchar(50),
 userEmail varchar(50),
 userPassword varchar(50)
)

create table userProfile(
  profileId  int primary key,
  userId int foreign key references [user](userId),
  userImage varchar(50),
  userBio varchar(50)
)

create table post(
  postId int primary key,
  userId  int foreign key references [user](userId),
  postImg varchar(50),
  postDes varchar(50)
)

create table comments(
 commentId int primary key,
 comment varchar(50),
 userId int foreign key references  [user](userId),
 postId int foreign key references  post(postId)
)

create table likes(
  likeId int primary key,
  userId int foreign key references  [user](userId),
  postId int foreign key references  post(postId)
)

create table sharedPosts(
 sharedId int primary key,
 userId int foreign key references  [user](userId),
 postId int foreign key references  post(postId)
)

create table friendRequest(
  friendRequest int primary key,
  requestBy int foreign key references [user](userId),
  requestedUser int foreign key references [user](userId),
  accepted varchar(50)  default 'pending'
)

create table savedPosts(
  savedPost int primary key,
  postId int foreign key references post(postId),
  userId int foreign key references [user](userId)
)

create table notifications (
  notificationId int primary key,
  userId int foreign key references [user](userId),
  notificationText varchar(255),
  isRead bit default 0,
);

create table chat (
  chatId int primary key,
  senderId int foreign key references [user](userId),
  receiverId int foreign key references [user](userId),
  messageText varchar(255),
  sentAt datetime default current_timestamp
);


insert into [user] (userId, userName, userEmail, userPassword)
values
  (1, 'JohnDoe', 'john.doe@example.com', 'password123'),
  (2, 'JaneSmith', 'jane.smith@example.com', 'password456'),
  (3, 'AliceJohnson', 'alice.johnson@example.com', 'password789'),
  (4, 'BobBrown', 'bob.brown@example.com', 'password101'),
  (5, 'CharlieDavis', 'charlie.davis@example.com', 'password202'),
  (6, 'DavidWilson', 'david.wilson@example.com', 'password303'),
  (7, 'EveClark', 'eve.clark@example.com', 'password404'),
  (8, 'FrankMiller', 'frank.miller@example.com', 'password505'),
  (9, 'GraceHall', 'grace.hall@example.com', 'password606'),
  (10, 'HenryAdams', 'henry.adams@example.com', 'password707'),
  (11, 'IvyCarter', 'ivy.carter@example.com', 'password808'),
  (12, 'JackEvans', 'jack.evans@example.com', 'password909');

insert into userProfile (profileId, userId, userImage, userBio)
values
  (1, 1, 'profile1.jpg', 'Hello, I am John. I love coding!'),
  (2, 2, 'profile2.jpg', 'Hi, I am Jane. A passionate developer.'),
  (3, 3, 'profile3.jpg', 'Hey, I am Alice. Tech enthusiast!'),
  (4, 4, 'profile4.jpg', 'Hi, I am Bob. I work in design.'),
  (5, 5, 'profile5.jpg', 'Hi there, I am Charlie. Gamer and coder.'),
  (6, 6, 'profile6.jpg', 'Greetings, I am David. A JavaScript lover.'),
  (7, 7, 'profile7.jpg', 'Hi, I am Eve. I love traveling!'),
  (8, 8, 'profile8.jpg', 'Hi, I am Frank. A backend developer.'),
  (9, 9, 'profile9.jpg', 'Hey, I am Grace. Photography enthusiast.'),
  (10, 10, 'profile10.jpg', 'Hi, I am Henry. Music is my life.'),
  (11, 11, 'profile11.jpg', 'Hi, I am Ivy. Aspiring artist.'),
  (12, 12, 'profile12.jpg', 'Hi, I am Jack. Blockchain explorer.');

insert into post (postId, userId, postImg, postDes)
values
  (1, 1, 'post1.jpg', 'My first post! Excited to be here.'),
  (2, 2, 'post2.jpg', 'Exploring new JavaScript frameworks!'),
  (3, 3, 'post3.jpg', 'A sunny day at the beach!'),
  (4, 4, 'post4.jpg', 'Just completed a design project!'),
  (5, 5, 'post5.jpg', 'Here is my new game concept!'),
  (6, 6, 'post6.jpg', 'Learning new features of ReactJS.'),
  (7, 7, 'post7.jpg', 'Traveling to Paris!'),
  (8, 8, 'post8.jpg', 'Backend coding tips!'),
  (9, 9, 'post9.jpg', 'My latest photography collection.'),
  (10, 10, 'post10.jpg', 'Top 5 music playlists to try.'),
  (11, 11, 'post11.jpg', 'A sneak peek of my new artwork.'),
  (12, 12, 'post12.jpg', 'Blockchain is the future!');

insert into comments (commentId, comment, userId, postId)
values
  (1, 'Great post, John!', 2, 1),
  (2, 'Nice job, Jane!', 3, 2),
  (3, 'Love this beach photo, Alice!', 4, 3),
  (4, 'Amazing design, Bob!', 5, 4),
  (5, 'Cool game concept, Charlie!', 6, 5),
  (6, 'React is awesome, David!', 7, 6),
  (7, 'Paris looks amazing, Eve!', 8, 7),
  (8, 'Great tips, Frank!', 9, 8),
  (9, 'Beautiful shots, Grace!', 10, 9),
  (10, 'Loved your playlist, Henry!', 11, 10),
  (11, 'Stunning artwork, Ivy!', 12, 11),
  (12, 'Blockchain for the win, Jack!', 1, 12);

insert into likes (likeId, userId, postId)
values
  (1, 2, 1), (2, 3, 1), (3, 4, 1),
  (4, 5, 2), (5, 6, 2), (6, 7, 2),
  (7, 8, 3), (8, 9, 3), (9, 10, 3),
  (10, 11, 4), (11, 12, 4), (12, 1, 4),
  (13, 2, 5), (14, 3, 5), (15, 4, 5);

insert into sharedPosts (sharedId, userId, postId)
values
  (1, 2, 1), (2, 3, 1), (3, 4, 1),
  (4, 5, 2), (5, 6, 2), (6, 7, 2),
  (7, 8, 3), (8, 9, 3), (9, 10, 3),
  (10, 11, 4), (11, 12, 4), (12, 1, 4);

insert into friendRequest (friendRequest, requestBy, requestedUser, accepted)
values
  (1, 1, 2, 'pending'), (2, 2, 3, 'accepted'),
  (3, 3, 4, 'pending'), (4, 4, 5, 'accepted'),
  (5, 5, 6, 'pending'), (6, 6, 7, 'accepted');

insert into savedPosts (savedPost, postId, userId)
values
  (1, 1, 2), (2, 2, 3), (3, 3, 4),
  (4, 4, 5), (5, 5, 6), (6, 6, 7),
  (7, 7, 8), (8, 8, 9), (9, 9, 10),
  (10, 10, 11), (11, 11, 12), (12, 12, 1);

insert into notifications (notificationId, userId, notificationText, isRead)
values
  (1, 1, 'John, your post received 3 likes!', 0),
  (2, 2, 'Jane, you have a new comment on your post!', 1),
  (3, 3, 'Alice, Bob sent you a friend request.', 0),
  (4, 4, 'Bob, your profile has been updated.', 1),
  (5, 5, 'Charlie, your game post received 5 shares!', 0),
  (6, 6, 'David, Eve liked your ReactJS post.', 0),
  (7, 7, 'Eve, Grace commented on your travel photo.', 1),
  (8, 8, 'Frank, your backend coding tips are popular!', 1),
  (9, 9, 'Grace, Henry saved your photography post.', 0),
  (10, 10, 'Henry, Ivy liked your music playlist.', 1),
  (11, 11, 'Ivy, Jack commented on your artwork.', 0),
  (12, 12, 'Jack, your blockchain post was shared 3 times!', 1);


insert into chat (chatId, senderId, receiverId, messageText, sentAt)
values
  (1, 1, 2, 'Hey Jane, how are you?', '2024-11-27 10:00:00'),
  (2, 2, 1, 'Hi John, I am good. How about you?', '2024-11-27 10:05:00'),
  (3, 3, 4, 'Hi Bob, I loved your recent design.', '2024-11-27 11:00:00'),
  (4, 4, 3, 'Thanks, Alice. Appreciate your feedback!', '2024-11-27 11:10:00'),
  (5, 5, 6, 'David, any updates on the new React feature?', '2024-11-27 12:00:00'),
  (6, 6, 5, 'Yes, Charlie. I will share it with you soon.', '2024-11-27 12:15:00'),
  (7, 7, 8, 'Frank, your backend tips are amazing!', '2024-11-27 13:00:00'),
  (8, 8, 7, 'Thanks, Eve. Glad you found them helpful.', '2024-11-27 13:30:00'),
  (9, 9, 10, 'Henry, your music playlist is a lifesaver.', '2024-11-27 14:00:00'),
  (10, 10, 9, 'Thanks, Grace. Glad you liked it!', '2024-11-27 14:20:00'),
  (11, 11, 12, 'Jack, what do you think about my new artwork?', '2024-11-27 15:00:00'),
  (12, 12, 11, 'Ivy, your artwork is stunning as always!', '2024-11-27 15:30:00');

  -- query for reset password

  update [user]
  set userPassword='newpassword22'
  where userEmail='john.doe@example.com' and userId=1

  -- query for get user profile

  select [user].userName,userProfile.userBio,userProfile.userImage
  from userProfile
  join [user]
  on  userProfile.userId =[user].userId
  where userProfile.userId=1

  -- query for update user profile

  update userProfile
  set userBio='hey here is rana' ,userImage='image222'
  where userId='1'

  -- query for update a post

  update post 
  set postImg='post11.png',postDes='here is my updated post'
  where postId=1 and userId=1

  -- query for delete a post

  delete from  post
  where post.postId=1 and post.userId =1

  -- query for sending all posts with user detail

  select post.postId,post.postImg,post.postDes,[user].userId ,[user].username,userProfile.userImage as profileimg
  from post 
  join [user] 
  on post.userId = [user].userId
  join userProfile
  on post.postId = userProfile.userId

  -- query for sending all posts of specific user

  select post.postId,post.postImg,post.postDes,[user].userId ,[user].username,userProfile.userImage as profileimg
  from post 
  join [user] 
  on post.userId = [user].userId
  join userProfile
  on post.postId = userProfile.userId
  where post.userId=1
  
  -- query for sending all comments of post

  select comments.comment ,[user].userId ,[user].username,userProfile.userImage as profileimg
  from comments
  join [user] 
  on comments.userId =[user].userId
  join userProfile
  on comments.userId=userProfile.userId
  where comments.postId=1

  --  query for sending all likes of post

  select [user].username ,[user].userId , userProfile.[userImage]
  from likes
  join [user]
  on likes.userId = [user].userId
  join userProfile
  on likes.userId = userProfile.userId
  where likes.postId=3

  -- query for counting likes on specific post

  select 
   count(likeId) AS TotalLikes 
  FROM 
   likes 
  where
   postId = 1; 

   -- query for selecting post with most likes

   select 
    post.postId, 
    post.postDes, 
    count(likes.likeId) AS TotalLikes 
   from 
    post 
   left join 
    likes on post.postId = likes.postId 
   group by 
    post.postId, post.postDes 
   order by 
    TotalLikes DESC 

  -- query for selecting friends of user

  select [user].userId, [user].userName, userProfile.userImage
  from friendRequest
  join [user] on friendRequest.requestedUser = [user].userId
  join userProfile on friendRequest.requestedUser = userProfile.userId
  where friendRequest.requestBy = 1 and accepted = 'accepted';

  --query for selecting all pending friend requests

  select
    friendRequest.friendRequest, 
    requestBy.userName AS RequestedBy, 
    requestedUser.userName AS RequestedTo 
  from
    friendRequest 
  join
    [user] AS requestBy ON friendRequest.requestBy = requestBy.userId 
  join
    [user] AS requestedUser ON friendRequest.requestedUser = requestedUser.userId 
  where
    friendRequest.accepted = 'pending';


  --query for selecting saved posts of specific user

  select post.postId, post.postImg, post.postDes
  from savedPosts
  join post on savedPosts.postId = post.postId
  where savedPosts.userId = 1;



  --query for selecting unread notifications of user

  select notificationId, notificationText
  from notifications
  where userId = 1 and isRead = 0;

  -- query for make notification read

  update notifications
  set isRead = 1
  where userId = 1 and isRead = 0;

  --query for selecting all notifications of specific user

  select notificationId, notificationText, isRead
  from notifications
  where userId = 1;

  -- all messages between two users

  select chatId, senderId, receiverId, messageText, sentAt
  from chat
  where (senderId = 1 and receiverId = 2) or (senderId = 2 and receiverId = 1)
  order by sentAt;

  -- query for count total users

  select 
    COUNT(userId) AS TotalUsers 
  from    
  [user];

