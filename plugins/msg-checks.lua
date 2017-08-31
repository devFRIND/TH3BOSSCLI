--Begin msg_checks.lua By @TH3BOSS
local function pre_process(msg)
local data = load_data(_config.moderation.data)
local chat = msg.to.id
local user = msg.from.id
local is_channel = msg.to.type == "channel"
local auto_leave = 'auto_leave_bot'

   if is_channel then
        local TIME_CHECK = 2
        if data[tostring(chat)] then
          if data[tostring(chat)]['settings']['time_check'] then
            TIME_CHECK = tonumber(data[tostring(chat)]['settings']['time_check'])
          end
        end
    if msg.text then
  if msg.text:match("(.*)") then
    if not data[tostring(msg.to.id)] and not redis:get(auto_leave) and not is_admin(msg) then
  tdcli.sendMessage(msg.to.id, "", 0, "_🌟| هذه المجموعه ليست في قائمة _ *مجموعاتي*", 0, "md")
  tdcli.changeChatMemberStatus(chat, our_id, 'Left', dl_cb, nil)
      end
   end
end
    if data[tostring(chat)] and data[tostring(chat)]['mutes'] then
		mutes = data[tostring(chat)]['mutes']
	else
		return
	end

	if mutes.mute_gif then
		mute_gif = mutes.mute_gif
	else
		mute_gif = '❌'
	end
   if mutes.mute_photo then
		mute_photo = mutes.mute_photo
	else
		mute_photo = '❌'
	end
	if mutes.mute_sticker then
		mute_sticker = mutes.mute_sticker
	else
		mute_sticker = '❌'
	end
	if mutes.mute_contact then
		mute_contact = mutes.mute_contact
	else
		mute_contact = '❌'
	end
	if mutes.mute_inline then
		mute_inline = mutes.mute_inline
	else
		mute_inline = '❌'
	end
	if mutes.mute_game then
		mute_game = mutes.mute_game
	else
		mute_game = '❌'
	end
	if mutes.mute_text then
		mute_text = mutes.mute_text
	else
		mute_text = '❌'
	end
	if mutes.mute_keyboard then
		mute_keyboard = mutes.mute_keyboard
	else
		mute_keyboard = '❌'
	end
	if mutes.mute_forward then
		mute_forward = mutes.mute_forward
	else
		mute_forward = '❌'
	end
	if mutes.mute_location then
		mute_location = mutes.mute_location
	else
		mute_location = '❌'
	end
   if mutes.mute_document then
		mute_document = mutes.mute_document
	else
		mute_document = '❌'
	end
	if mutes.mute_voice then
		mute_voice = mutes.mute_voice
	else
		mute_voice = '❌'
	end
	if mutes.mute_audio then
		mute_audio = mutes.mute_audio
	else
		mute_audio = '❌'
	end
	if mutes.mute_video then
		mute_video = mutes.mute_video
	else
		mute_video = '❌'
	end
	if mutes.mute_tgservice then
		mute_tgservice = mutes.mute_tgservice
	else
		mute_tgservice = '❌'
	end
	if data[tostring(chat)] and data[tostring(chat)]['settings'] then
		settings = data[tostring(chat)]['settings']
	else
		return
	end
	if settings.lock_link then
		lock_link = settings.lock_link
	else
		lock_link = '❌'
	end
	if settings.lock_join then
		lock_join = settings.lock_join
	else
		lock_join = '❌'
	end
	if settings.lock_tag then
		lock_tag = settings.lock_tag
	else
		lock_tag = '❌'
	end
	if settings.lock_pin then
		lock_pin = settings.lock_pin
	else
		lock_pin = '❌'
	end
	if settings.lock_mention then
		lock_mention = settings.lock_mention
	else
		lock_mention = '❌'
	end
		if settings.lock_edit then
		lock_edit = settings.lock_edit
	else
		lock_edit = '❌'
	end
		if settings.lock_spam then
		lock_spam = settings.lock_spam
	else
		lock_spam = '❌'
	end
	if settings.flood then
		lock_flood = settings.flood
	else
		lock_flood = '❌'
	end
	if settings.lock_markdown then
		lock_markdown = settings.lock_markdown
	else
		lock_markdown = '❌'
	end
	if settings.lock_webpage then
		lock_webpage = settings.lock_webpage
	else
		lock_webpage = '❌'
	end
		if settings.lock_woring then
		lock_woring = settings.lock_woring
	else
		lock_woring = '❌'
	end
	
	
	
	
  if msg.adduser or msg.joinuser or msg.deluser then
  if mute_tgservice == "☑️" then
del_msg(chat, tonumber(msg.id))
  end
end
if msg.from.username then
usernamex = "@"..(msg.from.username or "---")
member = "@"..(msg.from.username or "---")
else
usernamex = "ما مسوي  😹💔"
member = name_user
end

   if msg.pinned then
  if lock_pin == "☑️" then
     if is_owner(msg) then
      return
     end
     if tonumber(msg.from.id) == our_id then
      return
     end
    local pin_msg = data[tostring(chat)]['pin']
      if pin_msg then
  tdcli.pinChannelMessage(msg.to.id, pin_msg, 1)
       elseif not pin_msg then
   tdcli.unpinChannelMessage(msg.to.id)
          end
     tdcli.sendMessage(msg.to.id, msg.id, 0, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟| الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟| المعرف :</b> '..usernamex..'\n<i>♨️| عذرا التثبيث في هذه المجموعه مقفل ❌  </i>', 0, "html")

      end
  end
if not is_mod(msg) and not is_whitelist(msg.from.id, msg.to.id) and msg.from.id ~= our_id then
    
    	if msg.adduser or msg.joinuser then
		if lock_join == "☑️" then
			function join_kick(arg, data)
				kick_user(data.id_, msg.to.id)
			end
			if msg.adduser then
				tdcli.getUser(msg.adduser, join_kick, nil)
			elseif msg.joinuser then
				tdcli.getUser(msg.joinuser, join_kick, nil)
			end
		end
end
if msg.edited and lock_edit == "☑️" then

 del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌| عذراً ممنوع التعديل تم المسح 🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
     end

  end
if msg.forward_info_ and mute_forward == "☑️" then

  del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "‼️|عذرا ممنوع اعادة التوجيه  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    

  end
  end
if msg.photo_ and mute_photo == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|عذرا ممنوع ارسال الصور  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    


end
end
    if msg.video_ and mute_video == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|عذرا ممنوع ارسال الفيديو  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    


end
end
    if msg.document_ and mute_document == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|عذرا ممنوع ارسال الملفات  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    


end
end
    if msg.sticker_ and mute_sticker == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "‼️|عذرا ممنوع ارسال الملصقات  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    


end
end
    if msg.animation_ and mute_gif == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|عذرا ممنوع ارسال الصور المتحركه  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    


end
end
    if msg.contact_ and mute_contact == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|عذرا ممنوع ارسال جهات الاتصال  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    


end
end
    if msg.location_ and mute_location == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|عذرا ممنوع ارسال الموقع  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
end


end
    if msg.voice_ and mute_voice == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|عذرا ممنوع ارسال البصمات  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
     end


end
   if msg.content_ and mute_keyboard == "☑️" then
  if msg.reply_markup_ and  msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|عذرا الكيبورد مقفول  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
     end

  
   end
end
    if tonumber(msg.via_bot_user_id_) ~= 0 and mute_inline == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|عذرا الانلاين مقفول  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
     end


end
    if msg.game_ and mute_game == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|عذرا ممنوع لعب الالعاب  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
     end


end
    if msg.audio_ and mute_audio == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|عذرا ممنوع ارسال الصور  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
     end


end
if msg.media.caption then
local link_caption = msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.media.caption:match("[Tt].[Mm][Ee]/") or msg.media.caption:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
if link_caption and lock_link == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|عذرا ممنوع ارسال الروابط  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
     end


end
local tag_caption = msg.media.caption:match("@") or msg.media.caption:match("#")
if tag_caption and lock_tag == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|عذرا ممنوع ارسال التاك او المعرف  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
     end


end
if is_filter(msg, msg.media.caption) then

 del_msg(chat, tonumber(msg.id))
  
    end

end
if msg.text then
			local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
        local max_chars = 40
        if data[tostring(msg.to.id)] then
          if data[tostring(msg.to.id)]['settings']['set_char'] then
            max_chars = tonumber(data[tostring(msg.to.id)]['settings']['set_char'])
          end
        end
			 local _nl, real_digits = string.gsub(msg.text, '%d', '')
			local max_real_digits = tonumber(max_chars) * 50
			local max_len = tonumber(max_chars) * 51
			if lock_spam == "☑️" then
			if string.len(msg.text) > max_len or ctrl_chars > max_chars or real_digits > max_real_digits then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|ممنوع ارسال الكليشه والا سوف تجبرني على طردك  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
     end

  
   end
end
local link_msg = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") or msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") or msg.text:match("[Tt].[Mm][Ee]/") or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
if link_msg and lock_link == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|ممنوع ارسال الروابط  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
     end


end
local tag_msg = msg.text:match("@") or msg.text:match("#")
if tag_msg and lock_tag == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|ممنوع ارسال المعرف او التاك  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
     end


end
if is_filter(msg, msg.text) then
del_msg(chat, tonumber(msg.id))
end

if msg.text:match("(.*)") and mute_text == "☑️" then

   del_msg(chat, tonumber(msg.id))

   end
end
if mute_all == "☑️" then 

 del_msg(chat, tonumber(msg.id))

end
if msg.content_.entities_ and msg.content_.entities_[0] then
    if msg.content_.entities_[0].ID == "MessageEntityMentionName" then
      if lock_mention == "☑️" then

   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|MessageEntityMentionName  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
     end


          end
      end
  if msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
      if lock_webpage == "☑️" then
if is_channel then
   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|MessageEntityUrl  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
     end


          end
      end
  if msg.content_.entities_[0].ID == "MessageEntityBold" or msg.content_.entities_[0].ID == "MessageEntityCode" or msg.content_.entities_[0].ID == "MessageEntityPre" or msg.content_.entities_[0].ID == "MessageEntityItalic" then
      if lock_markdown == "☑️" then
if is_channel then
   del_msg(chat, tonumber(msg.id))
 if lock_woring == "☑️" then
     local msgx = "❌|الماركدوان  🗣"
tdcli.sendMessage(msg.to.id, 0, 1, '<b>🌟|الاسم :</b> <code>'..(msg.from.first_name or '')..'\n</code><b>🌟|الايدي :</b> <code>'..msg.from.id..'</code>\n<b>🌟|المعرف :</b> '..usernamex..'\n'..msgx, 0, "html")    
     end


          end
      end
 end
if msg.to.type ~= 'pv' then
  if lock_flood == "☑️" and not is_mod(msg) and not is_whitelist(msg.from.id, msg.to.id) and not msg.adduser and msg.from.id ~= our_id then
    local hash = 'user:'..user..':msgs'
    local msgs = tonumber(redis:get(hash) or 0)
        local NUM_MSG_MAX = 5
        if data[tostring(chat)] then
          if data[tostring(chat)]['settings']['num_msg_max'] then
            NUM_MSG_MAX = tonumber(data[tostring(chat)]['settings']['num_msg_max'])
          end
        end
    if msgs > NUM_MSG_MAX then
   if msg.from.username then
      user_name = "@"..msg.from.username
         else
      user_name = msg.from.first_name
     end
if redis:get('sender:'..user..':flood') then
return
else
   del_msg(chat, msg.id)
    kick_user(user, chat)

  tdcli.sendMessage(chat, msg.id, 0, "_🌟| العضو_ :  "..user_name.."\n _🌟|الايدي_ : `["..user.."]`\n _🌟| عذرا ممنوع التكرار في هذه المجموعه لقد تم طردك ☑️_\n 🌟| مـطـور الـسـورس : الزعـيـم > @TH3BOSS", 0, "md")
redis:setex('sender:'..user..':flood', 30, true)
      end
    end
    redis:setex(hash, TIME_CHECK, msgs+1)
               end
           end
      end
   end
end
end
end
return {
	patterns = {},
	pre_process = pre_process
}
--End msg_checks.lua--
