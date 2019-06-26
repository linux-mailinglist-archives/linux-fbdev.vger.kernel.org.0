Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1303C564B6
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Jun 2019 10:37:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbfFZIhX (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 26 Jun 2019 04:37:23 -0400
Received: from mga01.intel.com ([192.55.52.88]:22783 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725379AbfFZIhX (ORCPT <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 26 Jun 2019 04:37:23 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Jun 2019 01:37:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,419,1557212400"; 
   d="scan'208";a="170006863"
Received: from ccrisan-mobl.ger.corp.intel.com (HELO [10.249.33.85]) ([10.249.33.85])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Jun 2019 01:37:19 -0700
Subject: Re: [PATCH] vga_switcheroo: Depend upon fbcon being built-in, if
 enabled
To:     Daniel Vetter <daniel@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        kbuild test robot <lkp@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Yisheng Xie <ysxie@foxmail.com>, linux-fbdev@vger.kernel.org,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
References: <20190624092153.23375-1-daniel.vetter@ffwll.ch>
 <20190626083541.GJ12905@phenom.ffwll.local>
From:   Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <68ca07a2-d130-e87b-0ad8-f17c5d15163d@linux.intel.com>
Date:   Wed, 26 Jun 2019 10:37:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190626083541.GJ12905@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Op 26-06-2019 om 10:35 schreef Daniel Vetter:
> On Mon, Jun 24, 2019 at 11:21:53AM +0200, Daniel Vetter wrote:
>> Fixes linking fail when fbcon/fbdev is modular and vgaswitcheroo is
>> enabled:
>>
>> x86_64-linux-gnu-ld: drivers/gpu/vga/vga_switcheroo.o: in function `vga_switchto_stage2':
>> vga_switcheroo.c:(.text+0x997): undefined reference to `fbcon_remap_all'
>>
>> v2: I first tried to fix this with an EXPORT_SYMBOL, but vga_switcheroo is
>> never a module, so this doesn't work.
>>
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Reported-by: kbuild test robot <lkp@intel.com>
>> Fixes: 1cd51b5d200d ("vgaswitcheroo: call fbcon_remap_all directly")
>> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
>> Cc: Lukas Wunner <lukas@wunner.de>
>> Cc: Daniel Vetter <daniel.vetter@intel.com>
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: David Airlie <airlied@linux.ie>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
>> Cc: Sean Paul <sean@poorly.run>
>> Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Cc: Yisheng Xie <ysxie@foxmail.com>
>> Cc: linux-fbdev@vger.kernel.org
>> Cc: Daniel Thompson <daniel.thompson@linaro.org>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-fbdev@vger.kernel.org
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>
>> --
>> wrt merging probably best if Maarten adds this to the topic branch we
>> have already and sends out an updated pull request.
>>
>> Apologies for the mess.
>> -Daniel
>> ---
>>  drivers/gpu/vga/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/vga/Kconfig b/drivers/gpu/vga/Kconfig
>> index 84ab482d0db6..c8c770b05ed9 100644
>> --- a/drivers/gpu/vga/Kconfig
>> +++ b/drivers/gpu/vga/Kconfig
>> @@ -23,6 +23,7 @@ config VGA_SWITCHEROO
>>  	depends on X86
>>  	depends on ACPI
>>  	depends on PCI
>> +	depends on (FRAMEBUFFER_CONSOLE=n || FB=y)
>>  	select VGA_ARB
>>  	help
>>  	  Many laptops released in 2008/9/10 have two GPUs with a multiplexer
>> -- 
>> 2.20.1
>>
Thanks, pushed. :)

