Return-Path: <linux-fbdev+bounces-950-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 696DB84C239
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Feb 2024 03:03:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20B4428DA81
	for <lists+linux-fbdev@lfdr.de>; Wed,  7 Feb 2024 02:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 260AB1CD25;
	Wed,  7 Feb 2024 02:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="C5Y2YPnL"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp-relay-canonical-0.canonical.com (smtp-relay-canonical-0.canonical.com [185.125.188.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C851CD22;
	Wed,  7 Feb 2024 02:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707271405; cv=none; b=CPiqg1uVyDFe75ewQuXu7Qr/0ue01+nsK+ztaxKKUxFCeULKBLSnzkcul1PPsnhEcuNAmBUZM9Nc0GkCxXwtak9KqLqGTJZ1ojFh4Vlg9ufOTv4/drQJUYezFiUZPuXvEhanAL7jU2GF71ySdch07OFtq5TTF/CMsXMQxa85oJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707271405; c=relaxed/simple;
	bh=SDRE0rw/sH4xsb0pXCX2TzJd5P36l13633gOcChpp6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=YSq2UZNGB8z8pUzBLS8wx0K1tMXNoxs2CGdnyHi+9/gkdlq2Y6x/kg48uzV+Y3JN40JuYs4A0U1Xx6yoVnt6XQm5SjGNdnlLUcCznGyabmrP678Q1Qhy3WFoB830ZkuzTtFRVJbcj3vMvitFdaoHeEkeeiinCKL9PM2MZkvN8T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=C5Y2YPnL; arc=none smtp.client-ip=185.125.188.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from [192.168.178.2] (unknown [58.7.187.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 0B4983F2AE;
	Wed,  7 Feb 2024 02:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1707271398;
	bh=Uehal0PUIXb/o6zdMlG9jSwgBPrNjXIDJe97Eitsx0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type;
	b=C5Y2YPnLY3jPhMW16UrINrd7v5YGXF7kmIwzcsDJZPZZjbzsZBkxSxQqDjrOsuVou
	 trFwqozGDYEA5Y9IUzAo84+KEmHHIzZzF3uMYlj1v6NF7b+Yt4T9Th14AFnNIgFWMl
	 w16nNaO99a/CC1BcQ4BUORaamth6lwFoGFCIytkMz00twbc5ONymN3oJgLUBtnrBVd
	 dt6ABRuevfoArAT3S/uB7BsLz6/tOIASyoouF+JvY5HpYQb2YF2wyPrrJOBC9B0XRo
	 cJ734+tRhDmxLIAEfg2bzPhdFrdvC2FdgztxStzjBnGubrDNcZr2ghzBaWgLvTfwUe
	 2Ai4blqboNTsg==
Message-ID: <26893900-2d0d-4624-94f1-c4aa88386e9c@canonical.com>
Date: Wed, 7 Feb 2024 10:03:10 +0800
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] fbcon: Defer console takeover for splash screens
 to first switch
Content-Language: en-US
To: Mario Limonciello <mario.limonciello@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <f037df4a-8a97-4fcd-b196-43f484b63d8d@amd.com>
 <20240206101100.25536-1-daniel.van.vugt@canonical.com>
 <20240206101100.25536-2-daniel.van.vugt@canonical.com>
 <ZcJAVSyH3gRYx3EG@phenom.ffwll.local>
 <e4fc61ae-97f5-4fa1-bfed-1312466a2a22@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Jani Nikula <jani.nikula@intel.com>,
 Danilo Krummrich <dakr@redhat.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
From: Daniel van Vugt <daniel.van.vugt@canonical.com>
In-Reply-To: <e4fc61ae-97f5-4fa1-bfed-1312466a2a22@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/2/24 23:41, Mario Limonciello wrote:
> On 2/6/2024 08:21, Daniel Vetter wrote:
>> On Tue, Feb 06, 2024 at 06:10:51PM +0800, Daniel van Vugt wrote:
>>> Until now, deferred console takeover only meant defer until there is
>>> output. But that risks stepping on the toes of userspace splash screens,
>>> as console messages may appear before the splash screen. So check the
>>> command line for the expectation of userspace splash and if present then
>>> extend the deferral until after the first switch.
>>>
>>> V2: Added Kconfig option instead of hard coding "splash".
>>>
>>> Closes: https://bugs.launchpad.net/bugs/1970069
>>> Cc: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Daniel van Vugt <daniel.van.vugt@canonical.com>
>>> ---
>>>   drivers/video/console/Kconfig    | 13 +++++++++++
>>>   drivers/video/fbdev/core/fbcon.c | 38 ++++++++++++++++++++++++++++++--
>>>   2 files changed, 49 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/video/console/Kconfig b/drivers/video/console/Kconfig
>>> index bc31db6ef7..a6e371bfb4 100644
>>> --- a/drivers/video/console/Kconfig
>>> +++ b/drivers/video/console/Kconfig
>>> @@ -138,6 +138,19 @@ config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>         by the firmware in place, rather then replacing the contents with a
>>>         black screen as soon as fbcon loads.
>>>   +config FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>>> +    string "Framebuffer Console Deferred Takeover Condition"
>>> +    depends on FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>> +    default "splash"
>>> +    help
>>> +      If enabled this defers further the framebuffer console taking over
>>> +      until the first console switch has occurred. And even then only if
>>> +      text has been output, and only if the specified parameter is found
>>> +      on the command line. This ensures fbcon does not interrupt userspace
>>> +      splash screens such as Plymouth which may be yet to start rendering
>>> +      at the time of the first console output. "splash" is the simplest
>>> +      distro-agnostic condition for this that Plymouth checks for.
>>
>> Hm this seems a bit strange since a lot of complexity that no one needs,
>> also my impression is that it's rather distro specific how you want this
>> to work. So why not just a Kconfig option that lets you choose how much
>> you want to delay fbcon setup, with the following options:
>>
>> - no delay at all
>> - dely until first output from the console (which then works for distros
>>    which set a log-level to suppress unwanted stuff)
>> - delay until first vt-switch. In that case I don't think we also need to
>>    delay for first output, since vt switch usually means you'll get first
>>    output right away (if it's a vt terminal) or you switch to a different
>>    graphical console (which will keep fbcon fully suppressed on the drm
>>    side).
>>

I had similar thoughts, and had prototyped some of this already. But in the end
it felt like extra complexity there was no demand for.

If you would like to specify the preferred Kconfig design then I can implement
it. Though I don't think there is an enumeration type. It could also be a
runtime enumeration (deferred_takeover) controlled by fbcon=something.

> 
> IIUC there is an "automatic" VT switch that happens with Ubuntu GRUB + Ubuntu
> kernels.
> 
> Why?
> 
> Couldn't this also be suppressed by just not doing that?

I have not seen any automatic VT switches in debugging but now that you mention
it I was probably only debugging on drm-misc-next and not an Ubuntu kernel.

- Daniel

> 
>> I think you could even reuse the existing
>> CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER for this, and then just
>> compile-time select which kind of notifier to register (well plus the
>> check for "splash" on the cmdline for the vt switch one I guess).
>>
>> Thoughts?
>>
>> Cheers, Sima
>>
>>
>>> +
>>>   config STI_CONSOLE
>>>       bool "STI text console"
>>>       depends on PARISC && HAS_IOMEM
>>> diff --git a/drivers/video/fbdev/core/fbcon.c
>>> b/drivers/video/fbdev/core/fbcon.c
>>> index 63af6ab034..98155d2256 100644
>>> --- a/drivers/video/fbdev/core/fbcon.c
>>> +++ b/drivers/video/fbdev/core/fbcon.c
>>> @@ -76,6 +76,7 @@
>>>   #include <linux/crc32.h> /* For counting font checksums */
>>>   #include <linux/uaccess.h>
>>>   #include <asm/irq.h>
>>> +#include <asm/cmdline.h>
>>>     #include "fbcon.h"
>>>   #include "fb_internal.h"
>>> @@ -3358,6 +3359,26 @@ static int fbcon_output_notifier(struct
>>> notifier_block *nb,
>>>         return NOTIFY_OK;
>>>   }
>>> +
>>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>>> +static int initial_console;
>>> +static struct notifier_block fbcon_switch_nb;
>>> +
>>> +static int fbcon_switch_notifier(struct notifier_block *nb,
>>> +                 unsigned long action, void *data)
>>> +{
>>> +    struct vc_data *vc = data;
>>> +
>>> +    WARN_CONSOLE_UNLOCKED();
>>> +
>>> +    if (vc->vc_num != initial_console) {
>>> +        dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>>> +        dummycon_register_output_notifier(&fbcon_output_nb);
>>> +    }
>>> +
>>> +    return NOTIFY_OK;
>>> +}
>>> +#endif
>>>   #endif
>>>     static void fbcon_start(void)
>>> @@ -3370,7 +3391,16 @@ static void fbcon_start(void)
>>>         if (deferred_takeover) {
>>>           fbcon_output_nb.notifier_call = fbcon_output_notifier;
>>> -        dummycon_register_output_notifier(&fbcon_output_nb);
>>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>>> +        if (cmdline_find_option_bool(boot_command_line,
>>> +              CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION)) {
>>> +            initial_console = fg_console;
>>> +            fbcon_switch_nb.notifier_call = fbcon_switch_notifier;
>>> +            dummycon_register_switch_notifier(&fbcon_switch_nb);
>>> +        } else
>>> +#endif
>>> +            dummycon_register_output_notifier(&fbcon_output_nb);
>>> +
>>>           return;
>>>       }
>>>   #endif
>>> @@ -3417,8 +3447,12 @@ void __exit fb_console_exit(void)
>>>   {
>>>   #ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER
>>>       console_lock();
>>> -    if (deferred_takeover)
>>> +    if (deferred_takeover) {
>>>           dummycon_unregister_output_notifier(&fbcon_output_nb);
>>> +#ifdef CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER_CONDITION
>>> +        dummycon_unregister_switch_notifier(&fbcon_switch_nb);
>>> +#endif
>>> +    }
>>>       console_unlock();
>>>         cancel_work_sync(&fbcon_deferred_takeover_work);
>>> -- 
>>> 2.43.0
>>>
>>
> 

