Return-Path: <linux-fbdev+bounces-3291-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E0E99F420
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Oct 2024 19:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 677D628451E
	for <lists+linux-fbdev@lfdr.de>; Tue, 15 Oct 2024 17:32:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB8811FAF19;
	Tue, 15 Oct 2024 17:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="ezEAhYff"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390451FAF0C
	for <linux-fbdev@vger.kernel.org>; Tue, 15 Oct 2024 17:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729013473; cv=none; b=tpq5cGMV7TQZbLzBO+t+Di6SvCht82lrq9unLCa+ODN9/FY3RjMY+UAwtNuGvpmAiCk7Hvt0SmrRrXoOyTTOjBx2FHZ6eWm/mgMThnlGI8+fRTfjgEyb6eDzvPu7t4xHFmbegpg72Gb7iOhbaNXO4c5Vw5QvvF9hkMJjtXM1/Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729013473; c=relaxed/simple;
	bh=Nlkt2Fthyuj+02wChbrIoEHBospBClzz0I96zymXtIg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fOjeNeg3/VsXMiolIMAFz8QU70JElvfn/xbgz4EFDFf6/3T7EG9DXEnZwkH75yRQ2hJbJ7RszEUsiZLg0Nlu7EmsDcsrnurY6isVdUI+1DerN+lXeb7b/T+yYXpPdEmFAefIW14++a5UmpstNsIRi2e4snCXiT4hEYomCmvERSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca; spf=none smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=ezEAhYff; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ndufresne.ca
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4607b8c5392so9667671cf.3
        for <linux-fbdev@vger.kernel.org>; Tue, 15 Oct 2024 10:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1729013471; x=1729618271; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Nlkt2Fthyuj+02wChbrIoEHBospBClzz0I96zymXtIg=;
        b=ezEAhYffcG0/vwbVnX21PlKmb7lHFQRQq/iKmOagIIKWsH0M/fuGxAqvgd48cNkbew
         kXUaqUOLePn/VbFSMKUW6sqqzhGeCypOZh6wqcJs9qRSxcVvsRBNZAgltV+s+HXyKe/L
         Zx4nAY7M0Z/sZ5wlQfG+2b82Eq2JWmopE4/G6P98B48SydY85C2gAhGZgATZet/naHwS
         +KkBUs3uVrmH2bH12RjhkXYPhfwUgLr6FYkd63PTA83l7aY9t/uiO5byOARRmt1xlVzM
         eEXUVu1HdlfIH9qH/9JS4Uy+5V9w3YwrQH97QKopb8XOc48EtabDG/MLEjry4e/qf9A8
         tRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729013471; x=1729618271;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nlkt2Fthyuj+02wChbrIoEHBospBClzz0I96zymXtIg=;
        b=wgErhqH9mQSHP9mKgK7QmwJW45iPqc7QMwFlkaYyAPThHq//h8TJrs1PkhTYMjMI1y
         SwSZkQ6EWuBRc8lopEVxlpzdvAzKJ+yMZB4AxRMsgAP1DpbWlVTHfI564F6PDo1IlfvP
         ePdw3/btDCTPp8Q9jL0WALnv3sYaAOEWomv2CAoHjPJ5Q7MhLe/QVpY4AXIxuDxnQa41
         7XLTvnbovb+4oN/QtFLmbB2f6FvQP3im4/SAHlBTzEsLQAsxJlxkxovQ6QEjdt/bVGmd
         MeRwsFRRXdsXLaEXls5dYfKW3gcbq7mnTJ8qkLm5MyW0quEYF3EuTcMiX9EvQz0JXyUI
         Msdw==
X-Forwarded-Encrypted: i=1; AJvYcCWGnsNRkXNR0ncdy1+owBABFUtViWG4npEzH5qODxbns8/SWwTCKQD8wq6DadlAguxUOz4P+KH3qHrobw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznXXZIQn4cFgiby9tR1L4G8o0HVgTaysqo3VzQcP4Y7HVKcbaB
	x1ZPxPuBBF1o+TOqnRFyYyBop3f59rPMPd5s/5hebMMD9BoWfftc/cJigVY5eUo=
X-Google-Smtp-Source: AGHT+IHQTEqtyG1hqwhDEXmkug0vsLn7tK0TUCZGlPkVwJk5Fmx3FpOukVPbin+a6nZZiv9VlOtyKA==
X-Received: by 2002:a05:6214:33c3:b0:6cc:1dd9:296 with SMTP id 6a1803df08f44-6cc1dd9048bmr55656576d6.0.1729013471113;
        Tue, 15 Oct 2024 10:31:11 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cc229245f1sm8990646d6.57.2024.10.15.10.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 10:31:10 -0700 (PDT)
Message-ID: <c31b33f9c4c0a42e66249e2a108f4eadaf105ce2.camel@ndufresne.ca>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, Sascha
 Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Steve
 Longerbeam <slongerbeam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org,  linux-staging@lists.linux.dev
Date: Tue, 15 Oct 2024 13:31:09 -0400
In-Reply-To: <8aea6cc0-10bf-48b8-add9-eb3f1caa2d66@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
	 <20240724002044.112544-2-marex@denx.de>
	 <5e5fba4fd6c3c0c9df23697bd328367e5fdfa923.camel@ndufresne.ca>
	 <8aea6cc0-10bf-48b8-add9-eb3f1caa2d66@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Le lundi 29 juillet 2024 =C3=A0 04:16 +0200, Marek Vasut a =C3=A9crit=C2=A0=
:
> On 7/24/24 6:08 PM, Nicolas Dufresne wrote:
> > Hi Marek,
>=20
> Hi,
>=20
> > Le mercredi 24 juillet 2024 =C3=A0 02:19 +0200, Marek Vasut a =C3=A9cri=
t=C2=A0:
> > > Introduce dedicated memory-to-memory IPUv3 VDI deinterlacer driver.
> > > Currently the IPUv3 can operate VDI in DIRECT mode, from sensor to
> > > memory. This only works for single stream, that is, one input from
> > > one camera is deinterlaced on the fly with a helper buffer in DRAM
> > > and the result is written into memory.
> > >=20
> > > The i.MX6Q/QP does support up to four analog cameras via two IPUv3
> > > instances, each containing one VDI deinterlacer block. In order to
> > > deinterlace all four streams from all four analog cameras live, it
> > > is necessary to operate VDI in INDIRECT mode, where the interlaced
> > > streams are written to buffers in memory, and then deinterlaced in
> > > memory using VDI in INDIRECT memory-to-memory mode.
> >=20
> > Just a quick design question. Is it possible to chain the deinterlacer =
and the
> > csc-scaler ?
>=20
> I think you could do that.
>=20
> > If so, it would be much more efficient if all this could be
> > combined into the existing m2m driver, since you could save a memory ro=
untrip
> > when needing to deinterlace, change the colorspace and possibly scale t=
oo.
>=20
> The existing PRP/IC driver is similar to what this driver does, yes, but=
=20
> it uses a different DMA path , I believe it is IDMAC->PRP->IC->IDMAC .=
=20
> This driver uses IDMAC->VDI->IC->IDMAC . I am not convinced mixing the=
=20
> two paths into a single driver would be beneficial, but I am reasonably=
=20
> sure it would be very convoluted. Instead, this driver could be extended=
=20
> to do deinterlacing and scaling using the IC if that was needed. I think=
=20
> that would be the cleaner approach.

No strong opinion, in an ideal world all these hacks are removed and we do =
a
single multi-context / m2m media controller, that let user pick the path th=
ey
need for their task. When I look at the hardware documentation, you can do
inline from VDI to IC, and having IC in both drivers duplicates the CSC
handling. If you allow bypassing the VDI, then you have a duplicated driver=
 and
highly confused users. The fact the ipuv3 (internal) drm driver does not ha=
ve
the VDI already seems because the display controller driver is missing
interlaced video support, but I could be wrong. Same if you want to support=
 IRT
(even though that is not inline, but using a custom memory protocol).

Nicolas

