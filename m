Return-Path: <linux-fbdev+bounces-1257-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB1E8693DC
	for <lists+linux-fbdev@lfdr.de>; Tue, 27 Feb 2024 14:49:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1194E292D2B
	for <lists+linux-fbdev@lfdr.de>; Tue, 27 Feb 2024 13:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A44E145FFA;
	Tue, 27 Feb 2024 13:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ezYz7Fw3"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207F71419AA
	for <linux-fbdev@vger.kernel.org>; Tue, 27 Feb 2024 13:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709041642; cv=none; b=VaUFB37JieXoz0p99ce+avM8KFJqfSIb86MHl1SmUH1solyUPg6jfH2CQclk/EiIcreeAALsDitDl5VV71V1yZCgajenMHSIq5WWno6dui7bqpTmnV+RC2h4jtenFqcd6+KVS8Dy7vGyZ+MXDfihaKhkCxWM+avWf+QBZQyhTag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709041642; c=relaxed/simple;
	bh=roxPi8rz4oNq2vNNNxEbsD8R+MWfx531DvbZ2mENdBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c/jNYfFa2gsXL/MicszK9YEX6Ru8UQOss9IES/7xyy8rCnANr19E0YuJMbyOcg0CDfHWY/IFbML9S8699lRHv4ffDZEmq8jdSJ7MKcqwPYRXWiiImA2EbYV3xbVfv2Wrj0jTjpm8Lzsuspie5bx2XoATmjap+e5IpwygmZI5Kc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ezYz7Fw3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709041639;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hTVBC0lkZuIsWB3rrhjB8rqd7JwC06vqd7+76BYU8ms=;
	b=ezYz7Fw3t3tTBNX1V6aRqlnALqblL4K9+X6eyyhSPulEbEgryJkoRzNRBnyZYQh3UMN160
	QR7Z1X7xPhsMBxxeraza0QyIbeDJTGLhujVYFKrS22F1VmYdumBrPTa5vKq7N+wPK0grvC
	Utj+CkRctf1b/JwOlANDs88Iee+DOMw=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-9wxpbIM8OlGJ1Fd31u6sqQ-1; Tue, 27 Feb 2024 08:47:17 -0500
X-MC-Unique: 9wxpbIM8OlGJ1Fd31u6sqQ-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d27af05d98so30151331fa.1
        for <linux-fbdev@vger.kernel.org>; Tue, 27 Feb 2024 05:47:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709041636; x=1709646436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hTVBC0lkZuIsWB3rrhjB8rqd7JwC06vqd7+76BYU8ms=;
        b=QKpfkxFIIEDYuhB2rVSz+y233uKb5ECO6jDSr9zLs+9uDdXm9SbyK0s49qv9u3uwM7
         HsczNe7nVIevifXceC0bA8g2l+7ybObrPgDw1cIsQ5ANp/N+Lt6D30kFJL50V7pGkNM4
         j/4fYPviemJIyK8og8lCjiQ9KBr220FH9Ul/d123dlHkz/gHaSF1RLRcQd73UTfXIac9
         wd9L7fEGOwPBXuV/EVi1nQtcxxwh0BpJ5XT16bpkHup7GERacY3Z2RatCExp2mj/oFYs
         xizHZ31Zz1JAZOlRrbd7yrdt9bomXzOcxEMb43PekpRAZfzZlmSTzm+kDU9Zr7WxRTX3
         LxBA==
X-Forwarded-Encrypted: i=1; AJvYcCXzyACzTlwxkxLN6zD/YO4qrV36golwg7qmLYzageZhC/DphZePSbPjeK54j44l6ZCWyCUgr+EHTA878I47mwyEWvYkgoT56qhlrqc=
X-Gm-Message-State: AOJu0YypDu2txQ3arotmQ0BNtreJNqJIUHS4cTYkm/Vn4rqDW2tFH3YI
	LVa5Te3M1k8ZQtO4/T0ojY9WetW0qYw6dsAIMcBQQgckU1MrRZ1CxtAhrcYKPZgLtPDSTv7ENgG
	t9YIFhtA8cy2kyuv4C1omCTlLtAf2eIsvMCPqo423hfaqXEbmGaXKSo7wGN0+
X-Received: by 2002:ac2:5d24:0:b0:512:e4f4:b562 with SMTP id i4-20020ac25d24000000b00512e4f4b562mr5674285lfb.31.1709041636291;
        Tue, 27 Feb 2024 05:47:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGLf7Vwour/XjLoxR2iw6tIoak85hY2uSnJmHhcKtZd8K/kuXb6PkldJJSdOoGoEaALcMMGrQ==
X-Received: by 2002:ac2:5d24:0:b0:512:e4f4:b562 with SMTP id i4-20020ac25d24000000b00512e4f4b562mr5674270lfb.31.1709041635850;
        Tue, 27 Feb 2024 05:47:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id xa9-20020a170907b9c900b00a3e7a2d9ac4sm783359ejc.6.2024.02.27.05.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 05:47:15 -0800 (PST)
Message-ID: <f3cdd944-5e68-49e5-bae8-4bc1f9f59131@redhat.com>
Date: Tue, 27 Feb 2024 14:47:14 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] fbcon: Defer console takeover for splash screens to
 first switch
Content-Language: en-US, nl
To: Daniel van Vugt <daniel.van.vugt@canonical.com>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Jani Nikula <jani.nikula@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Sebastien Bacher <seb128@ubuntu.com>
References: <20240202085408.23251-1-daniel.van.vugt@canonical.com>
 <20240202085408.23251-2-daniel.van.vugt@canonical.com>
 <7817a2a2-b07d-4e9d-85e6-c11c5720d66e@redhat.com>
 <39ffe230-36ac-484a-8fc1-0a12d6c38d82@canonical.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <39ffe230-36ac-484a-8fc1-0a12d6c38d82@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 2/27/24 02:06, Daniel van Vugt wrote:
> On 27/2/24 02:23, Hans de Goede wrote:
>> Hi All,
>>
>> On 2/2/24 09:53, Daniel van Vugt wrote:
>>> Until now, deferred console takeover only meant defer until there is
>>> output. But that risks stepping on the toes of userspace splash screens,
>>> as console messages may appear before the splash screen. So check for the
>>> "splash" parameter (as used by Plymouth) and if present then extend the
>>> deferral until the first switch.
>>
>> Daniel, thank you for your patch but I do not believe that this
>> is the right solution. Deferring fbcon takeover further then
>> after the first text is output means that any errors about e.g.
>> a corrupt initrd or the kernel erroring out / crashing will not
>> be visible.
> 
> That's not really correct. If a boot failure has occurred after the splash then
> pressing escape shows the log.

Hmm, I guess this is with the latest plymouth which has a builtin terminal
emulator for kernels without VT support ? Pressing ESC does not to a VC
switch and AFAICT that is what you are triggering on to allow fbcon takeover
after this patches.

> If a boot failure has occurred before the splash
> then it can be debugged visually by rebooting without the "splash" parameter.

Which requires the user to know this and requires the user to know how to
edit kernel cmdline parameters in e.g. grub. This is not a good user
experience. We want inexperienced users to just be able to point
a phone camera at the screen and take a picture of the errors.


>> When the kernel e.g. oopses or panics because of not finding
>> its rootfs (I tested the latter option when writing the original
>> deferred fbcon takeover code) then fbcon must takeover and
>> print the messages from the dying kernel so that the user has
>> some notion of what is going wrong.
> 
> Indeed, just reboot without the "splash" parameter to do that.

Again not something beginning Linux users will be able to do,
what happened to "Ubuntu: Linux for Human Beings" ?

>> And since your patch seems to delay switching till the first
>> vc-switch this means that e.g. even after say gdm refusing
>> to start because of issues there still will be no text
>> output. This makes debugging various issues much harder.
> 
> I've debugged many gdm failures and it is never useful to use the console for
> those. Reboot and get the system journal instead.

But users will not see any errors now, meaning they don't
even know where to begin with troubleshooting ...

>> Moreover Fedora has been doing flickerfree boot for many
>> years without needing this.
> 
> I believe Fedora has a mostly working solution, but not totally reliable, as
> mentioned in the commit message:
> 
> "even systems whose splash exists in initrd may not be not immune because they
>  still rely on racing against all possible kernel messages that might
>  trigger the fbcon takeover"

Only very serious kernel errors like oopses or panics will
trigger the takeover and that is *exactly* what we want.

There is a race where plymouth may hide such vary serious
messages, if plymouth does manage to start before the errors,
but that is actually an existing issue which we don't want
to make bigger by *always* hiding such errors.

>> The kernel itself will be quiet as long as you set
>> CONFIG_CONSOLE_LOGLEVEL_QUIET=3 Ubuntu atm has set this
>> to 4 which means any kernel pr_err() or dev_err()
>> messages will get through and since there are quite
>> a few false positives of those Ubuntu really needs
>> to set CONFIG_CONSOLE_LOGLEVEL_QUIET=3 to fix part of:
>> https://bugs.launchpad.net/bugs/1970069
> 
> Incorrect. In my testing some laptops needed log level as low as 2 to go quiet.
> And the Ubuntu kernel team is never going to fix all those for non-sponsored
> devices.

Notice that atm Ubuntu's kernel is using the too high
CONFIG_CONSOLE_LOGLEVEL_QUIET=4 with
CONFIG_CONSOLE_LOGLEVEL_QUIET=3 getting any errors logged
to the console should be very very rare.

The only thing I can think of is if the kernel oopses
/ WARN()s early on but the cause is innocent enough
that the boot happily continues.

In that case actually showing the oops/WARN() is a good
thing.

For all the years Fedora has had flickerfree boot I have
seen zero bug reports about this. If you have examples
of this actually being a problem please file bugs for
them (launchpad or bugzilla.kernel.org is fine) and
then lets take a look at those bugs and fix them.

These should be so rare that I'm not worried about this
becoming a never ending list of bugs (unlike pr_err() /
dev_err() messages of which there are simply too many).

>> After that it is "just" a matter of not making userspace
>> output anything unless it has errors to report.
>>
>> systemd already is quiet by default (only logging
>> errors) when quiet is on the kernel commandline.
> 
> Unfortunately not true for Ubuntu. We carry a noisy systemd patch which I'm
> told we can't remove in the short term:
> 
> https://bugs.launchpad.net/ubuntu/+source/plymouth/+bug/1970069/comments/39

Well then make the patch less noisy? Suppressing non
error message unless in debug mode should be easy
even with a downstream patch.

> Thanks for your input, but I respectfully disagree and did consider these
> points already.

Sorry, but your real problem here seems to be your
noisy downstream systemd patch. I'm not going to ack
a kernel patch which I consider a bad idea because
Ubuntu has a non standard systemd patch which is
to trigger happy with spamming the console.

So this is still a NACK from me.

Regards,

Hans





>>> Closes: https://bugs.launchpad.net/bugs/1970069
>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
>>> ---
>>>  drivers/video/fbdev/core/fbcon.c | 32 +++++++++++++++++++++++++++++---
>>>  1 file changed, 29 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
>>> index 63af6ab034..5b9f7635f7 100644
>>> --- a/drivers/video/fbdev/core/fbcon.c
>>> +++ b/drivers/video/fbdev/core/fbcon.c
>>> @@ -76,6 +76,7 @@
>>>  #include <linux/crc32.h> /* For counting font checksums */
>>>  #include <linux/uaccess.h>
>>>  #include <asm/irq.h>
>>> +#include <asm/cmdline.h>
>>>  
>>>  #include "fbcon.h"
>>>  #include "fb_internal.h"
>>> @@ -146,6 +147,7 @@ static inline void fbcon_map_override(void)
>>>  
>>>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>  static bool deferred_takeover = true;
>>> +static int initial_console = -1;
>>>  #else
>>>  #define deferred_takeover false
>>>  #endif
>>> @@ -3341,7 +3343,7 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
>>>  	console_unlock();
>>>  }
>>>  
>>> -static struct notifier_block fbcon_output_nb;
>>> +static struct notifier_block fbcon_output_nb, fbcon_switch_nb;
>>>  static DECLARE_WORK(fbcon_deferred_takeover_work, fbcon_register_existing_fbs);
>>>  
>>>  static int fbcon_output_notifier(struct notifier_block *nb,
>>> @@ -3358,6 +3360,21 @@ static int fbcon_output_notifier(struct notifier_block *nb,
>>>  
>>>  	return NOTIFY_OK;
>>>  }
>>> +
>>> +static int fbcon_switch_notifier(struct notifier_block *nb,
>>> +				 unsigned long action, void *data)
>>> +{
>>> +	struct vc_data *vc = data;
>>> +
>>> +	WARN_CONSOLE_UNLOCKED();
>>> +
>>> +	if (vc->vc_num != initial_console) {
>>> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>>> +		dummycon_register_output_notifier(&fbcon_output_nb);
>>> +	}
>>> +
>>> +	return NOTIFY_OK;
>>> +}
>>>  #endif
>>>  
>>>  static void fbcon_start(void)
>>> @@ -3370,7 +3387,14 @@ static void fbcon_start(void)
>>>  
>>>  	if (deferred_takeover) {
>>>  		fbcon_output_nb.notifier_call = fbcon_output_notifier;
>>> -		dummycon_register_output_notifier(&fbcon_output_nb);
>>> +		fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
>>> +		initial_console = fg_console;
>>> +
>>> +		if (cmdline_find_option_bool(boot_command_line, "splash"))
>>> +			dummycon_register_switch_notifier(&fbcon_switch_nb);
>>> +		else
>>> +			dummycon_register_output_notifier(&fbcon_output_nb);
>>> +
>>>  		return;
>>>  	}
>>>  #endif
>>> @@ -3417,8 +3441,10 @@ void __exit fb_console_exit(void)
>>>  {
>>>  #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>  	console_lock();
>>> -	if (deferred_takeover)
>>> +	if (deferred_takeover) {
>>>  		dummycon_unregister_output_notifier(&fbcon_output_nb);
>>> +		dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>>> +	}
>>>  	console_unlock();
>>>  
>>>  	cancel_work_sync(&fbcon_deferred_takeover_work);
>>
> 


