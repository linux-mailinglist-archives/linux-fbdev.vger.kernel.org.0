Return-Path: <linux-fbdev+bounces-3932-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A13A4608D
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Feb 2025 14:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F94E3A71C5
	for <lists+linux-fbdev@lfdr.de>; Wed, 26 Feb 2025 13:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36B472192EE;
	Wed, 26 Feb 2025 13:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Vj51z+uc";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fvlMAn+D"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0606A1AF0B8;
	Wed, 26 Feb 2025 13:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740575951; cv=none; b=Z39r3Iw2rtcIdtsKnkPVJco3FE9CHgPvzgv+XESnBAvTwGrnjBji7HpNWf09qO8+zFUGTIAxt4FSGjKFTnMm8bqW8pn/UYMAOUJ/s0WkHz8FRAB09v4Qbsh/mH5Y14oIhZRWwTvk7Vkxapnr4aZEKe+0pcY8Gj/Xd1tSshwmM2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740575951; c=relaxed/simple;
	bh=Lj3Ctgm7NZ6KeH4zbqWmLO8wuZosl0vGgvp1DgxPET8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GiniwEWZr8acAx4Q+sbFc6NPrUhOBTfBwXjWF5Qp7GcEkOYPmO6gMeJ7UCDFmaJJAKqJbg7Et28ZlABUWaGmXO+yaPOdUBKy7y2chs4/9Cd9DFqnjudL8gaR9lCKwr/TkSp3mgVrR7ncpo3O8SaaCElWzkGmWxuD3NRWuoCKJzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Vj51z+uc; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fvlMAn+D; arc=none smtp.client-ip=202.12.124.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfout.stl.internal (Postfix) with ESMTP id C7DDC11400D1;
	Wed, 26 Feb 2025 08:19:07 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Wed, 26 Feb 2025 08:19:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740575947;
	 x=1740662347; bh=UOZ4mYVIFdHTT9aEkdVg/UTAHR5Mna/PggP4OynHPN0=; b=
	Vj51z+ucrADMcGvPqgqm/ocyub19PD6MhBlhIXOjDkMHHQrXIoD20teKX+xNT1Zz
	AXLjQis+dGRDMnzTDBswrYrAgopT1GRSFlqVjgdwZZKU0WZKHen3lzZPiKM4Wk8r
	nai+TBLBqRej9mDuNQE6WWAOmnH+0EujDEPCWSXIBDqd6TXN8y5jPnhbOmCGLqAt
	MoRcttDaaPfRveyhiyOJVHWNL1EDf3c5gK1+yFglSp/2TIhR3AglzZxkQKPeQBxd
	MsFZ3VeWpMryBpJHKuKulTzzgbXJIxUJUqb4w3X/kHKYs5KjqK5xVJSJjOGzekNf
	6Q+r4oMTHv605qMhlo6bag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740575947; x=
	1740662347; bh=UOZ4mYVIFdHTT9aEkdVg/UTAHR5Mna/PggP4OynHPN0=; b=f
	vlMAn+D0OgBAbrUqB8/MFQSJG4PCDpgig7vU5ZUqhkzF1tvJusovpC/BZ4uZ1EYV
	ZhLeuB9pgsiSRCEj95M/AM5UmWiVGo3N3hFVaFTdUNN62524J22Wi7//qjidWCso
	cq+yTwxVyD4Iwla1hBnzuvqcbTbC1+haZ29yNxExZTYRLLbSS5Hh9YdSki6MEOCg
	7tiZPskxi3jW/vkaR2pD5eyp2cQIYyYO1zVP7ZMvDHfPeB3NUK5FTje9kjoAc2eS
	jbR87RNxIUarqUAiOxqHB4wncfeFz8jOdc6DDS8/sDfQwF989CyfwtRAw4JFZ1GH
	/yqmoP+pEx/sIfakxgQVA==
X-ME-Sender: <xms:yxS_Z6qOOLfzklww1--oi0qfaUrTdjq1-WVjRtzkVH5yja5by4s4eQ>
    <xme:yxS_Z4qW7wtd7fsum4uEViAYsaLmi-DC0Cv27_VgyW2m2X8AAYNhuoPoGEuwziM2w
    1H8wc4gIq297NQeEC8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeeikecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeek
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeguvghllhgvrhesghhmgidruggvpd
    hrtghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhk
    hheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegurhhiqdguvg
    hvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepjhgr
    vhhivghrmhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnh
    esshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhfsgguvghvsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:yxS_Z_Ns28A9EpUPipAK62UZsgV4g1ZSXq956j1168XrUDQrkY3T2w>
    <xmx:yxS_Z54hN7DqCojVjxK3CIYOBJbCqfOWW45Qwjc6UHicALTLLVwFTg>
    <xmx:yxS_Z54Imc1xlBHDZovquYk91g6UG_qQCS_Xn8-2MEwuLFb3ZcEmaA>
    <xmx:yxS_Z5g7dX5-PTdzwF0F5VTdCY1owA7G6RhCuIK5hqgyFaHVQTxbJw>
    <xmx:yxS_Z0bX88-s-Yzjw4WeScj6dc3Lj5BaKxN-8sRLlhSarnBie8vVa6qh>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E80192220072; Wed, 26 Feb 2025 08:19:06 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 26 Feb 2025 14:18:46 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Javier Martinez Canillas" <javierm@redhat.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Arnd Bergmann" <arnd@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Helge Deller" <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-Id: <98ed694b-0f2f-4bfb-9280-729842d9f95c@app.fastmail.com>
In-Reply-To: <87mse8zzb0.fsf@minerva.mail-host-address-is-not-set>
References: <20250225164436.56654-1-arnd@kernel.org>
 <4d047af3-fd30-4fa4-aa3d-c0359856d750@suse.de>
 <a2c0e681-2cdf-4dc9-82fc-be35f54ff795@app.fastmail.com>
 <29ecc7c4-2887-4989-a1d3-aa76b44c0387@suse.de>
 <79d35e3b-9a0d-41a5-ab07-797bfa1e19cb@app.fastmail.com>
 <87mse8zzb0.fsf@minerva.mail-host-address-is-not-set>
Subject: Re: [PATCH 1/3] dummycon: only build module if there are users
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Feb 26, 2025, at 13:05, Javier Martinez Canillas wrote:
> "Arnd Bergmann" <arnd@arndb.de> writes:
>> in drivers/video/console, with the simpler alternative just
>> calling into fbcon functions. I'm not sure if we can already drop
>> vgacon from normal x86-64 distro configs, i.e. if there are cases
>> that are not already covered by any of efi-earlycon, efifb,
>> vga16fb, vesafb/uvesafb or a PCI DRM driver.
>>
>
> I believe vgacon is still useful for x86 with legacy BIOS, because
> vesafb (and simpledrm) only works if the user defines a mode using
> the vga= kernel cmdline parameter.

Right, at the minimum, a configuration without vgacon would
have to pick a graphical mode in arch/x86/boot/video*.c if one
wasn't already set by grub.

Looking through the git history of that code, it seems that there
are lots of corner cases with weird 32-bit hardware.
Anything from the past 20 years is probably reasonably safe,
but there still needs to be a way to configure vgacon back in
to be safe.

    Arnd

