Return-Path: <linux-fbdev+bounces-3792-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CF7A335EF
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Feb 2025 04:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AACF166F96
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Feb 2025 03:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B218204687;
	Thu, 13 Feb 2025 03:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="M82ODiF9"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F1EB13D539;
	Thu, 13 Feb 2025 03:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739416013; cv=none; b=HIvT4/o1UvPrhh15wPo8RDsgJ6sR2DmZwe15H2/13wIzwtkflrq1GtHfw8qaSdbIcpyqBXH0aBA8zbojI2aegF+wzBbGkweuQSHMIr6tATotkWM4FHF6lrNhhsda9BZ9zYJ8Rc3eQpCJWyjrjKD6IyBGioJgcZK80NVnBrJZA7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739416013; c=relaxed/simple;
	bh=h5gxzzrrzWcmj0oqnFTojHFpZwzkb+vfOC9mY41Ihzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4EjThZiEej7gJMN7PYfOXKvki9PDHEb3sxTdk1gnGhfWgvlwpnIen04x+SVmfOzQ8pTtyqKIOWGbsixnJs00AXraLm8KolhgKV4pcfNEofTU3jxnnF8TxUOEQNO2qoYHKEi9tuTGcfpJb6CUTxxqwG3lY9eEiEeFCfxQDbCemM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=M82ODiF9; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: by linux.microsoft.com (Postfix, from userid 1127)
	id EC17A203F3CE; Wed, 12 Feb 2025 19:06:50 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EC17A203F3CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1739416010;
	bh=ildVpwYVvhezs9I8BAi45vYVgvdz4RusC9W0T4n7tYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M82ODiF9MEKCEK3Udr0lBzPDkB5D8YITWC5xTs/2eDqu2oaIdA5nZlWXCLAb28fd7
	 goZD8RNvMFKG8ghFK5p/QomP+KYlTeyAcKUuNcWLJPM+P7qkPPBpFLdOKITywWR1TV
	 wb9qyCfwapQvMvYRJLBq7PXC76e8TuBQtPqDgdK4=
Date: Wed, 12 Feb 2025 19:06:50 -0800
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: Michael Kelley <mhklinux@outlook.com>
Cc: "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
	"wei.liu@kernel.org" <wei.liu@kernel.org>,
	"decui@microsoft.com" <decui@microsoft.com>,
	"deller@gmx.de" <deller@gmx.de>,
	"weh@microsoft.com" <weh@microsoft.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: Re: [PATCH 1/1] fbdev: hyperv_fb: iounmap() the correct memory when
 removing a device
Message-ID: <20250213030650.GA24166@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20250209235252.2987-1-mhklinux@outlook.com>
 <20250210124043.GA17819@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <SN6PR02MB4157B0F36D7B99A5BF01471CD4F22@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250210145825.GA12377@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <20250210165221.GA3465@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <SN6PR02MB4157C1DF0A0101EEF4CA79E2D4FF2@SN6PR02MB4157.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157C1DF0A0101EEF4CA79E2D4FF2@SN6PR02MB4157.namprd02.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)

On Thu, Feb 13, 2025 at 01:35:22AM +0000, Michael Kelley wrote:
> From: Saurabh Singh Sengar <ssengar@linux.microsoft.com> Sent: Monday, February 10, 2025 8:52 AM
> > 
> [snip]
> > > > >
> > > > > While we are at it, I want to mention that I also observed below WARN
> > > > > while removing the hyperv_fb, but that needs a separate fix.
> > > > >
> > > > >
> > > > > [   44.111220] WARNING: CPU: 35 PID: 1882 at drivers/video/fbdev/core/fb_info.c:70 framebuffer_release+0x2c/0x40
> > > > > < snip >
> > > > > [   44.111289] Call Trace:
> > > > > [   44.111290]  <TASK>
> > > > > [   44.111291]  ? show_regs+0x6c/0x80
> > > > > [   44.111295]  ? __warn+0x8d/0x150
> > > > > [   44.111298]  ? framebuffer_release+0x2c/0x40
> > > > > [   44.111300]  ? report_bug+0x182/0x1b0
> > > > > [   44.111303]  ? handle_bug+0x6e/0xb0
> > > > > [   44.111306]  ? exc_invalid_op+0x18/0x80
> > > > > [   44.111308]  ? asm_exc_invalid_op+0x1b/0x20
> > > > > [   44.111311]  ? framebuffer_release+0x2c/0x40
> > > > > [   44.111313]  ? hvfb_remove+0x86/0xa0 [hyperv_fb]
> > > > > [   44.111315]  vmbus_remove+0x24/0x40 [hv_vmbus]
> > > > > [   44.111323]  device_remove+0x40/0x80
> > > > > [   44.111325]  device_release_driver_internal+0x20b/0x270
> > > > > [   44.111327]  ? bus_find_device+0xb3/0xf0
> > > > >
> > > >
> > > > Thanks for pointing this out. Interestingly, I'm not seeing this WARN
> > > > in my experiments. What base kernel are you testing with? Are you
> > > > testing on a local VM or in Azure? What exactly are you doing
> > > > to create the problem? I've been doing unbind of the driver,
> > > > but maybe you are doing something different.
> > > >
> > > > FWIW, there is yet another issue where after doing two unbind/bind
> > > > cycles of the hyperv_fb driver, there's an error about freeing a
> > > > non-existent resource. I know what that problem is, and it's in
> > > > vmbus_drv.c. I'll be submitting a patch for that as soon as I figure out
> > > > a clean fix.
> > > >
> > > > Michael
> > >
> > > This is on local Hyper-V. Kernel: 6.14.0-rc1-next-20250205+
> > > I run below command to reproduce the above error:
> > > echo "5620e0c7-8062-4dce-aeb7-520c7ef76171" >
> > /sys/bus/vmbus/devices/5620e0c7-8062-4dce-aeb7-520c7ef76171/driver/unbind
> > >
> > > When hvfb_remove is called I can see the refcount for framebuffer is 2 when ,
> > > I expect it to be 1. After unregistering this framebuffer there is still 1 refcount
> > > remains, which is the reason for this WARN at the time of framebuffer_release.
> > >
> > > I wonder who is registering/using this extra framebuffer. Its not hyperv_drm or
> > > hyperv_fb IIUC.
> > >
> > > - Saurabh
> > 
> > Here are more details about this WARN:
> > 
> > Xorg opens `/dev/fb0`, which increases the framebuffer's reference
> > count, as mentioned above.  As a result, when unbinding the driver,
> > this WARN is expected, indicating that the framebuffer is still in use.
> > 
> > I am open to suggestion what could be the correct behavior in this case.
> > There acan be two possible options:
> > 
> >  1. Check the framebuffer reference count and prevent the driver from
> >     unbinding/removal.
> > OR
> > 
> >  2. Allow the driver to unbind while issuing this WARN. (Current scenario)
> > 
> 
> >From looking at things and doing an experiment, I think there's a 3rd
> option, which gets rid of the of the WARN while still allowing the unbind.
> 
> The experiment is to boot Linux in a Gen2 Hyper-V guest with both the
> Hyper-V FB and Hyper-V DRM modules removed. In this case, the
> generic EFI framebuffer driver (efifb) should get used. With this driver,
> a program can open /dev/fb0, and while it is open, unbind the efifb
> driver (which is in /sys/bus/platform/drivers/efi-framebuffer).
> Interestingly, there's no WARN generated. But when the hyperv_fb
> driver is loaded and used, the WARN *is* generated, as you observed.
> 
> So I looked at the code for efifb.  It does the framebuffer_release()
> call in a function that hyperv_fb doesn't have. Based on the comments
> in efifb.c, we need a similar function to handle the call to
> framebuffer_release().  And the efifb driver also does the iounmap()
> in that same function, which makes we wonder if the hyperv_fb
> driver should do similarly. It will need a little more analysis to
> figure that out.
> 
> You found the bug.  Do you want to work on fixing the hyperv_fb
> driver? And maybe the Hyper-V DRM driver needs the same fix.
> I haven't looked. Alternatively, if you are busy, I can work on the fix.
> Let me know your preference.
> 
> Michael

Thanks for your analysis, its a good to know about fbib driver is not having
this issue. We can take it as a reference.

At the first look I see efib driver is having a fb_ops.fb_destroy function
which gets called after put_fb_info (responsible for decrementing the
ref count). Also it uses devm_register_framebuffer which handles the registration
and unregister of framebuffer more gracefully.

I will work on this.

- Saurabh

