Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62FB8453333
	for <lists+linux-fbdev@lfdr.de>; Tue, 16 Nov 2021 14:49:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236872AbhKPNwZ (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 16 Nov 2021 08:52:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28949 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236836AbhKPNwY (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 16 Nov 2021 08:52:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1637070567;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3OTy/9YrFlHb1FbgIXV6RVmtWPM+q99vU/2+dtI6ml4=;
        b=BNHOz1+h0E7CbcjqgGKy2Uq+4mVpBIcAbLidyxeSX0Z/QF/2Z5C4IJCJavWjhW2bsbMjNN
        WA6Y0Am35j25U1ZunEQnDZYysbFBDkPu1LYElaSZayD+RvHA49vebVt44wE9S6oL2eiKxV
        bTetvilFZw121e/T3pg6VfWtphqcPqQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-o1CbxaG_NhuLAcEYGi6CCA-1; Tue, 16 Nov 2021 08:49:25 -0500
X-MC-Unique: o1CbxaG_NhuLAcEYGi6CCA-1
Received: by mail-wm1-f72.google.com with SMTP id 205-20020a1c00d6000000b003335d1384f1so1238455wma.3
        for <linux-fbdev@vger.kernel.org>; Tue, 16 Nov 2021 05:49:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=3OTy/9YrFlHb1FbgIXV6RVmtWPM+q99vU/2+dtI6ml4=;
        b=zNa2UBdtqED2fpH6GQQKNhUM80ytb66RlsAaiVEt5FSxU9YLMYv4Od0RFKol4Fvaxd
         p9RpL/YgaHQNZHtufu+jdxxKWUY+idXZMgBekdvc+ja6bPIb+3JVcqptCHhSxhZaUQ3M
         JDts4VyUJcOnCI5D+iUu23ED+s7RA5/v+J2wI2b8GswnCX+K+Cz1wnHcE6aY/H+G79IG
         AbETtXKklgGIDcN2z9dKqJ8de4qNW5dCLdpTjQY2BnxBFZ0l6FTFl6BU5hkTMcuwt98R
         r/IlR0CZRjpZi9Gv1VuSPn28NZ0IlZwdMQPsUPT0sjPU35+Y8TDrzchDVk1OWFOliKmZ
         oWUg==
X-Gm-Message-State: AOAM531gVCaD13fHBZ7DFVpzJuQNDXnoATy55xmJLSBVdLKhwE2JPJ9B
        /epzxPINJsN9e91M2X1f5T3MmLxB3MBGjU5qNQa+wsXMwVIp36B4FCVLiCxGnGimzlWIo3PSRZ0
        1SJzfi0vU26Wx1f2jELza6jk=
X-Received: by 2002:adf:e387:: with SMTP id e7mr9648480wrm.412.1637070564716;
        Tue, 16 Nov 2021 05:49:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxA2+Uq7LQFH/v6rrXJG7SiujqhI87w7fpQ+njuY49G4fs4N3h5OBpPDk4Z/+ieJE2TAY7GFw==
X-Received: by 2002:adf:e387:: with SMTP id e7mr9648431wrm.412.1637070564424;
        Tue, 16 Nov 2021 05:49:24 -0800 (PST)
Received: from [192.168.1.102] (91.pool90-171-47.dynamic.orange.es. [90.171.47.91])
        by smtp.gmail.com with ESMTPSA id b10sm18226962wrt.36.2021.11.16.05.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 05:49:23 -0800 (PST)
Message-ID: <74ca8095-7f09-b373-5434-8fefbbaf6476@redhat.com>
Date:   Tue, 16 Nov 2021 14:49:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] fbdev: Prevent probing generic drivers if a FB is
 already registered
Content-Language: en-US
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        Peter Jones <pjones@redhat.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Ilya Trukhanov <lahvuun@gmail.com>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Borislav Petkov <bp@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20211111111120.1344613-1-javierm@redhat.com>
 <CAMuHMdWA2V_KDpcpMw3yRKmN+6YDjmysJoz6D-6JjJs-3+XYTQ@mail.gmail.com>
 <579a584a-68af-d5c9-0547-30cb1592d46f@redhat.com>
 <CAMuHMdWotEN1TtTr7douLkQPkpXE-rQgamM3GOYO1XNHbUiguw@mail.gmail.com>
 <7cbadb2a-b6e9-f264-9d95-b76c7071af27@redhat.com>
In-Reply-To: <7cbadb2a-b6e9-f264-9d95-b76c7071af27@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

On 11/16/21 11:01, Javier Martinez Canillas wrote:
> Hello Geert,
> 
> On 11/16/21 10:43, Geert Uytterhoeven wrote:
> 
> [snip]
> 
>>>
>>> So this is already a fragile solution and $SUBJECT doesn't make things worse
>>> IMO. Since not having something like this can lead to issues as reported by:
>>>
>>> https://lore.kernel.org/all/20211110200253.rfudkt3edbd3nsyj@lahvuun/
>>>
>>> We could probably do some smarter here by providing a function that checks
>>> if the registered fbdev drivers matches the aperture base. But I'm unsure
>>> if that's worth it. After all, fbdev drivers are likely to be disabled by
>>> most distros soon now that we have the simpledrm driver.
>>
>> Checking the aperture base is what was done in all other cases of
>> preventing generic (fbdev) drivers from stepping on specific drivers'
>> toes...
>>
> 
> Ok, I can re-spin the patch checking if the aperture ranges overlap. There's
> an apertures_overlap() function in drivers/video/fbdev/core/fbmem.c that can
> be exported for fbdev drivers to use.
> 

So I tried the following patch [0]. But when testing on a VM, the efifb driver
is probed even after the virtio_gpu driver has already been probed. Being a DRM
driver, it doesn't use the fbdev infra and AFAIU doesn't reserve any apertures.

When the {efi,simple}fb drivers check if there's an aperture already reserved
using the fb_aperture_registered() helper, this just returns false even when a
driver for the same hardware was already registered. The kernel log says:

[    0.891512] checking generic (0 0) vs hw (c0000000 1d5000)

That is because when DRM_FBDEV_EMULATION=y, the virtio_gpu driver registers an
fbdev but without any aperture set.

I discussed this with Thomas and even though $SUBJECT is just a workaround, it
seems that is the best we can do as an heuristic to prevent the generic fbdev
drivers to be probed after a native DRM driver.

[0]:
From d962c20bc9fd90c2525d79b69e632d99e8050fc5 Mon Sep 17 00:00:00 2001
From: Javier Martinez Canillas <javierm@redhat.com>
Date: Thu, 11 Nov 2021 00:55:06 +0100
Subject: [PATCH v4] fbdev: Prevent probing generic drivers if a FB is already
 registered

The efifb and simplefb drivers just render to a pre-allocated frame buffer
and rely on the display hardware being initialized before the kernel boots.

But if another driver already probed correctly and registered a fbdev, the
generic drivers shouldn't be probed since an actual driver for the display
hardware is already present.

This is more likely to occur after commit d391c5827107 ("drivers/firmware:
move x86 Generic System Framebuffers support") since the "efi-framebuffer"
and "simple-framebuffer" platform devices are registered at a later time.

Link: https://lore.kernel.org/r/20211110200253.rfudkt3edbd3nsyj@lahvuun/
Fixes: d391c5827107 ("drivers/firmware: move x86 Generic System Framebuffers support")
Reported-by: Ilya Trukhanov <lahvuun@gmail.com>
Cc: <stable@vger.kernel.org> # 5.15.x
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v4:
- Only fail to probe if a registered fbdev has overlapping aperture (Geert).

Changes in v3:
- Cc <stable@vger.kernel.org> since a Fixes: tag is not enough (gregkh).

Changes in v2:
- Add a Link: tag with a reference to the bug report (Thorsten Leemhuis).
- Add a comment explaining why the probe fails earlier (Daniel Vetter).
- Add a Fixes: tag for stable to pick the fix (Daniel Vetter).
- Add Daniel Vetter's Reviewed-by: tag.
- Improve the commit message and mention the culprit commit

 drivers/video/fbdev/core/fbmem.c | 16 ++++++++++++++++
 drivers/video/fbdev/efifb.c      | 11 +++++++++++
 drivers/video/fbdev/simplefb.c   | 11 +++++++++++
 include/linux/fb.h               |  1 +
 4 files changed, 39 insertions(+)

diff --git drivers/video/fbdev/core/fbmem.c drivers/video/fbdev/core/fbmem.c
index 826175ad88a2..9906b83132cb 100644
--- drivers/video/fbdev/core/fbmem.c
+++ drivers/video/fbdev/core/fbmem.c
@@ -1546,6 +1546,22 @@ static bool fb_do_apertures_overlap(struct apertures_struct *gena,
 	return false;
 }
 
+bool fb_aperture_registered(struct apertures_struct *a)
+{
+	int i;
+
+	for_each_registered_fb(i) {
+		struct apertures_struct *gen_aper;
+
+		gen_aper = registered_fb[i]->apertures;
+		if (fb_do_apertures_overlap(gen_aper, a))
+			return true;
+	}
+
+	return false;
+}
+EXPORT_SYMBOL(fb_aperture_registered);
+
 static void do_unregister_framebuffer(struct fb_info *fb_info);
 
 #define VGA_FB_PHYS 0xA0000
diff --git drivers/video/fbdev/efifb.c drivers/video/fbdev/efifb.c
index edca3703b964..1ad6698b2e05 100644
--- drivers/video/fbdev/efifb.c
+++ drivers/video/fbdev/efifb.c
@@ -457,6 +457,17 @@ static int efifb_probe(struct platform_device *dev)
 	info->apertures->ranges[0].base = efifb_fix.smem_start;
 	info->apertures->ranges[0].size = size_remap;
 
+	/*
+	 * Generic drivers must not be registered if a framebuffer exists.
+	 * If a native driver was probed, the display hardware was already
+	 * taken and attempting to use the system framebuffer is dangerous.
+	 */
+	if (fb_aperture_registered(info->apertures)) {
+		dev_err(&dev->dev,
+			"efifb: a framebuffer is already registered\n");
+		return -EINVAL;
+	}
+
 	if (efi_enabled(EFI_MEMMAP) &&
 	    !efi_mem_desc_lookup(efifb_fix.smem_start, &md)) {
 		if ((efifb_fix.smem_start + efifb_fix.smem_len) >
diff --git drivers/video/fbdev/simplefb.c drivers/video/fbdev/simplefb.c
index 62f0ded70681..3ad0f538ca91 100644
--- drivers/video/fbdev/simplefb.c
+++ drivers/video/fbdev/simplefb.c
@@ -456,6 +456,17 @@ static int simplefb_probe(struct platform_device *pdev)
 	info->apertures->ranges[0].base = info->fix.smem_start;
 	info->apertures->ranges[0].size = info->fix.smem_len;
 
+	/*
+	 * Generic drivers must not be registered if a framebuffer exists.
+	 * If a native driver was probed, the display hardware was already
+	 * taken and attempting to use the system framebuffer is dangerous.
+	 */
+	if (fb_aperture_registered(info->apertures)) {
+		dev_err(&pdev->dev,
+			"simplefb: a framebuffer is already registered\n");
+		return -EINVAL;
+	}
+
 	info->fbops = &simplefb_ops;
 	info->flags = FBINFO_DEFAULT | FBINFO_MISC_FIRMWARE;
 	info->screen_base = ioremap_wc(info->fix.smem_start,
diff --git include/linux/fb.h include/linux/fb.h
index 6f3db99ab990..f1fbdb39932b 100644
--- include/linux/fb.h
+++ include/linux/fb.h
@@ -604,6 +604,7 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
 			    size_t count, loff_t *ppos);
 
 /* drivers/video/fbmem.c */
+extern bool fb_aperture_registered(struct apertures_struct *a);
 extern int register_framebuffer(struct fb_info *fb_info);
 extern void unregister_framebuffer(struct fb_info *fb_info);
 extern int remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
-- 
2.33.1

Best regards,
-- 
Javier Martinez Canillas
Linux Engineering
Red Hat

