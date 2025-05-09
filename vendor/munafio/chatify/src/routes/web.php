<?php
/**
 * -----------------------------------------------------------------
 * NOTE : There is two routes has a name (user & group),
 * any change in these two route's name may cause an issue
 * if not modified in all places that used in (e.g Chatify class,
 * Controllers, chatify javascript file...).
 * -----------------------------------------------------------------
 */

use Illuminate\Support\Facades\Route;

/*
* This is the main app route [Chatify Messenger]
*/
Route::get('/', 'MessagesController@index')->name(config('chatify.routes.prefix'))->middleware('XSS','auth');

/**
 *  Fetch info for specific id [user/group]
 */
Route::post('/idInfo', 'MessagesController@idFetchData')->middleware('XSS','auth');

/**
 * Send message route
 */
Route::post('/sendMessage', 'MessagesController@send')->name('send.message')->middleware('XSS','auth');

/**
 * Fetch messages
 */
Route::post('/fetchMessages', 'MessagesController@fetch')->name('fetch.messages')->middleware('XSS','auth');

/**
 * Download attachments route to create a downloadable links
 */
Route::get('/download/{fileName}', 'MessagesController@download')->name(config('chatify.attachments.download_route_name'))->middleware('XSS','auth');

/**
 * Authentication for pusher private channels
 */
Route::post('/chat/auth', 'MessagesController@pusherAuth')->name('pusher.auth')->middleware('XSS','auth');

/**
 * Make messages as seen
 */
Route::post('/makeSeen', 'MessagesController@seen')->name('messages.seen')->middleware('XSS','auth');

/**
 * Get contacts
 */
Route::get('/getContacts', 'MessagesController@getContacts')->name('contacts.get')->middleware('XSS','auth');

/**
 * Update contact item data
 */
Route::post('/updateContacts', 'MessagesController@updateContactItem')->name('contacts.update')->middleware('XSS','auth');


/**
 * Star in favorite list
 */
Route::post('/star', 'MessagesController@favorite')->name('star')->middleware('XSS','auth');

/**
 * get favorites list
 */
Route::post('/favorites', 'MessagesController@getFavorites')->name('favorites')->middleware('XSS','auth');

/**
 * Search in messenger
 */
Route::get('/search', 'MessagesController@search')->name('search')->middleware('XSS','auth');

/**
 * Get shared photos
 */
Route::post('/shared', 'MessagesController@sharedPhotos')->name('shared')->middleware('XSS','auth');

/**
 * Delete Conversation
 */
Route::post('/deleteConversation', 'MessagesController@deleteConversation')->name('conversation.delete')->middleware('XSS','auth');

/**
 * Delete Message
 */
Route::post('/deleteMessage', 'MessagesController@deleteMessage')->name('message.delete')->middleware('XSS','auth');

/**
 * Update setting
 */
Route::post('/updateSettings', 'MessagesController@updateSettings')->name('avatar.update')->middleware('XSS','auth');

/**
 * Set active status
 */
Route::post('/setActiveStatus', 'MessagesController@setActiveStatus')->name('activeStatus.set')->middleware('XSS','auth');






/*
* [Group] view by id
*/
Route::get('/group/{id}', 'MessagesController@index')->name('group')->middleware('XSS','auth');

/*
* user view by id.
* Note : If you added routes after the [User] which is the below one,
* it will considered as user id.
*
* e.g. - The commented routes below :
*/
// Route::get('/route', function(){ return 'Munaf'; })// works as a route
Route::get('/{id}', 'MessagesController@index')->name('user')->middleware('XSS','auth');
// Route::get('/route', function(){ return 'Munaf'; }) // works as a user id
