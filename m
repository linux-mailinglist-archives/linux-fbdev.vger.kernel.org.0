Return-Path: <linux-fbdev+bounces-3347-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9039B5451
	for <lists+linux-fbdev@lfdr.de>; Tue, 29 Oct 2024 21:46:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9811B1F24678
	for <lists+linux-fbdev@lfdr.de>; Tue, 29 Oct 2024 20:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667DF209671;
	Tue, 29 Oct 2024 20:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="N0etzfqq"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123613207
	for <linux-fbdev@vger.kernel.org>; Tue, 29 Oct 2024 20:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730234576; cv=none; b=BrVV8Jc/8PNbhImZ7FJ+QKrF86FxDKNTu3BxHVxga755BgMB0MwP823PmE0VvgakW9+FW/UUo5l/aOK9hSX9w+rCRLSdaD4K0E0AoQb7ocaX3p4/MsZJsj8JXW6SU7n/J0hitLMTBfAa9KfoubsFe6j/sgRAColyploCkvNlfXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730234576; c=relaxed/simple;
	bh=0D1Eu4CEWDg4ut3MzYYiF/4jTU/35JQUDIzPSI8vn/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=pflCh/XN1tgVREaLhEa/Sr5PYzGfQdf1rl+6HSs7HC414Tfk51lKfoaWHbnQlY1lZj/+asw2r/eXm6DSGp5pG50lTI/FGDffERrwwFN2YAd1c2ZERgNy6FGiFycom70pT/4WMn29dMa56/MYP6lmvq3/7K3AhFyITIaA/iZjkYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=N0etzfqq; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1730234566; x=1730839366; i=deller@gmx.de;
	bh=0D1Eu4CEWDg4ut3MzYYiF/4jTU/35JQUDIzPSI8vn/4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=N0etzfqqTfWhXC5tuvxLHXfmg21CpWoiFYyOo4satGV8g2Qm5HT/i6LI8f3CxuCx
	 tIg4z9HM1RnnOLqeGl9NI14Dsgr4OjxSVsGv7jbHJN/K0nVgs3ry+gp9omWAJnFrE
	 t2Qc2hAoeey6eVJVxDhdxU9UY5cs4bzq6bCaY8Mf92SKE8DYO5EJaQZo2tyXlG7Mg
	 mVjGCb0RfuCFcSD3+lPS4MxmYJbc1aIfxnAifHYaarSKG8jIMAAa3zZ4tFztldL+k
	 aw+P5IOLeDONXs6PSMa+9Bv5tBmmcxY8JZoUZ6gMRWlxDefzUCNks4438DdY9lbqR
	 J8qZa+8iQ4Kph3lSFQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.235]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsUp-1t572v2TvD-003yiP; Tue, 29
 Oct 2024 21:42:46 +0100
Message-ID: <5b4bfeaf-d9b4-4196-b1e8-ef58b1b6607e@gmx.de>
Date: Tue, 29 Oct 2024 21:42:45 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: udl: Make CONFIG_FB_DEVICE optional
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241025092538.38339-1-gonzalo.silvalde@gmail.com>
 <7aabca78-dd34-4819-8a63-105d1a4cb4ba@gmx.de>
 <7e33bfa5-1444-4152-b240-946a51e12b26@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <7e33bfa5-1444-4152-b240-946a51e12b26@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TfYxtZKStYsidpMp4qCoQvknJWSrk3oV54S/ubC7IlaPZfpIJKM
 8yGvT2IjwMbxfiZTIa4X3GiY0fvHYvtoyfMMl1N/uYnbdCEq56oKUGIBEWr+tXpOAVWOAV1
 Vsx7aWU+2BE3OZdKwR2kgjPdwxSSuHeyqsHsSYhUIsQxZSHnbY3ZKBmHpRz77CqFK3RzauT
 NfodDibuF4SdksFykr5Tg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Fv2GBLJKLac=;kBW6yFb12UOOUyo2rrDc3rqMTVs
 3qaapEFM8jOVyxzxMmZe4Vcrn4WUQ1ycJUaSjI8GiZAG/+lHf+828j8LTSkbXwfNVC3EVaLyX
 2rQXSATLuKW6dvcSqrVlbEYzYPQ5Otf7wAESIFCoCoV1J+ZsEhpXY9tGdoixbPHEQbUGnWuEV
 Qp5d1pO2hQG6Vn4RDml0/96Ys5CRYgzhgQJvPJkc/6MOYIQN0eu9Xb3zQAdy9mu/NL/he8a4V
 eYBUR583KDl5gii2k90pFyKNJMvH/W1BUkaFhH6vGviZLnaItaBIseCwk3Q3egMe+drlc4iNO
 +yq6H+WsFHyCHaRqIVsay00SMbWuusrikEl8XkDq6YDQXr5vI7YiddHcm7P/Mc2tB022qPfWX
 ROz8EqIv0kgw6qlPavNKfZkjDGH26udg4z10yfZKXIesMO1AOOLTXGQpkkP2gp28jKzhcpQXd
 VrrEz5vJJzd5/AVkB6/sCJ8JIJdfFSQw6y8tlAuc2dtUUEhEWGwlzIIEse5QQFqBitNGFzGlO
 WPn6n+221nnyNIpqabH/IYInG/sE1R5DKNdsB5Bv49ka6RPpNS9wcoxgi3uwjnEu8mu19zRX+
 PQSWRcPsLJpQaLZGIvWUmHRU4TJMCaOrIAaN+zbJGxDW/w0kBL8CobszjpPMO76L+c3YSsABg
 Gi+CVPn72SR6Whux4ca1p6XBZrh4YA+xZz7rVBZGLLDyXM1bA2KzEbt7Wht4WiRcOqqvtV8ng
 PjCOOg1/CVQJrl4Z/8g12dCIo7tbJI/v9GHQuoVXgfTy6s+qTRVsvKXxyx9SPAoX9xS0NnuTI
 bZjTigx7HCsNGCLmupL0kuAg==

Hi Thomas,

On 10/28/24 09:41, Thomas Zimmermann wrote:
> Am 25.10.24 um 17:37 schrieb Helge Deller:
>> On 10/25/24 11:25, Gonzalo Silvalde Blanco wrote:
>>> The fb_udl driver currently depends on CONFIG_FB_DEVICE to create sysf=
s
>>> entries and access framebuffer device information. This patch wraps th=
e
>>> relevant code blocks with #ifdef CONFIG_FB_DEVICE, allowing the driver=
 to
>>> be built and used even if CONFIG_FB_DEVICE is not selected.
>>>
>>> The sysfs setting only controls access to certain framebuffer attribut=
es
>>> and is not required for the basic display functionality to work correc=
tly.
>>> (For information on DisplayLink devices and their Linux support, see:
>>> https://wiki.archlinux.org/title/DisplayLink).
>>>
>>> Tested by building with and without CONFIG_FB_DEVICE, both of which
>>> compiled and ran without issues.
>>
>> Gonzalo, I don't like this patch very much.
>>
>> It adds lots of #ifdefs around functions like dev_dbg().
>> Instead of ifdefs, aren't there other possibilities, e.g.
>> using fb_dbg() if appropriate?
>> Or using any other generic dbg() info or simply dropping the line?
>
> I talked Gonzalo into sending this patch. I think dev_dbg() calls
> should be replaced with fb_dbg(), same for _info() and _err(). That's
> probably worth doing anyway.

Yes, but I doubt every of those calls can be replaced...

>> But more important:
>> This is a fbdev driver and currently depends on CONFIG_FB_DEVICE.
>> If I'm right, the only reason to disable CONFIG_FB_DEVICE is if
>> you want fbdev output at bootup, but otherwise just want to use DRM.
>
> It's unrelated to booting. CONFIG_FB_DEVICE enables/disables
> userspace interfaces (/dev/fb*, /sys/graphics/fb*). Even without,
> there's still fbcon that runs on top of the fbdev driver.

Sure, I meant that if people enable a fdev driver, they most likely
want /dev/fb as well ..... unless they want to use mostly DRM drivers.

>> But then, doesn't there exist a native DRM driver for this graphics
>> card which can be used instead?
>> If so, I suggest to not change this fbdev driver at all.
>
> Or can we talk about removing udlfb entirely? I tried before, but
> there was one person still using it. [1] He had concerns about udl's
> (the DRM driver) stability. I think DRM's udl has matured enough and
> is in better shape than udlfb. Maybe we can try again.> [1] https://lore=
.kernel.org/dri-devel/20201130125200.10416-1-tzimmermann@suse.de/

The stability was one of the issues, but IMHO the *main* issue he mentions=
 is this:

The framebuffer driver is faster, it keeps back buffer and updates only
data that differ between the front and back buffer. The DRM driver doesn't
have such optimization, it will update everything in a given rectangle -
this increases USB traffic and makes video playback more jerky.

That's exactly the main concern I'm regularily bringing up and which
IMHO is the main reason we still have many fbdev drivers.
You added support for some of those graphics cards with native DRM
drivers, but all of them are unaccelerated. This hurts a lot on old
machines and as such specific cards are ugly slowly with DRM.
A good example for this is the kvm drm graphics driver which is sluggish
and slow when using KVM.

I'm happy to get rid of the fbdev drivers, but for that DRM really needs
to allow some sort of native fillrect, copyarea and imageblt operations so
that we can get performance back on the old cards when implementing them
as DRM driver.

Helge

