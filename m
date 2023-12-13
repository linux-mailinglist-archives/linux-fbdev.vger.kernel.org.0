Return-Path: <linux-fbdev+bounces-380-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E2880EDA9
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Dec 2023 14:32:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7319F1C20B94
	for <lists+linux-fbdev@lfdr.de>; Tue, 12 Dec 2023 13:32:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6566461FB6;
	Tue, 12 Dec 2023 13:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="f4Q0fog3"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B7183;
	Tue, 12 Dec 2023 05:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1702387923; x=1702992723; i=deller@gmx.de;
	bh=fB8PiBcuhvGnNUkT7BldfgICp+Ldg32EiwwpyCNS/ak=;
	h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:
	 In-Reply-To;
	b=f4Q0fog3SlvFu5iNl7pTXJ3ZdZm0IBsfKHIoV8w5EQHrnfC8/xxvI770QTNt321s
	 kaVhVMxb2kWYSXcg9ec/ndhesTiEgMkyOwmeAnIxM/UtjAQro3QMCTSNB7QccSwiV
	 NUqi98VR5S+7jFFmtmjCgrp6DJD5jKPRxDsIGp75FKBQTTA5Oap7s4IzkjXm8oD8O
	 OTLLPssNvF39uLzYCqr7pBkBeZ+kGJyIj1etcWzAVZGx9fSzqJqhx4VePiu2wr1fh
	 rk9upbAlXE2Di6PDcgABK48HGNWXpsNAHcIxo5KESDp0b15cp3DTQxQHRw4W/NgB2
	 50G12kecqdTwe5RfUA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [10.8.0.6] ([78.94.87.245]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtfJX-1rUSA01wzf-00vA8S; Tue, 12
 Dec 2023 14:32:03 +0100
Message-ID: <1f800b42-03a2-452e-b2a3-912250936413@gmx.de>
Date: Tue, 12 Dec 2023 14:32:01 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] fbdev: Remove support for Carillo Ranch driver
Content-Language: en-US
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-fbdev@vger.kernel.org, linux-mtd@lists.infradead.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, Lee Jones <lee@kernel.org>,
 Andy Lowe <alowe@mvista.com>, Thomas Hellstrom <thellstrom@vmware.com>,
 Alan Hourihane <alanh@fairlite.co.uk>
References: <20231208224703.1603264-1-willy@infradead.org>
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20231208224703.1603264-1-willy@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BRJmEkGqYOZyzRlqUk63K4rJprAmn7UmKJYRspfJse6lLB+F/6a
 EcPNNOy9Cy2C1T+QfIGy6C0EN/LuB3eMJjoS1CgQSdC3Ctk4lMhzKknxNOTuqemBvxg9hyZ
 cDabJ/1X+VGz1ECLTxLgM/9D1cVt7lQ5ZrqiL4FGsdoXVAVvJlsKu/7/6mK1llfLezjNUOF
 ITDfoLfkYy8RyH6O9/GkA==
UI-OutboundReport: notjunk:1;M01:P0:IbC+rewAqxI=;udtC9rOmNWDsPoiiAH8R7sgC+Mq
 L7JXuUXpakhGBDH73aVpmeyslMyi552f0zVVksEElMoLz39tCEMTP2AG1RTbQ79tPpVSvMLHV
 fKpu0Ebn4GVZLZ9qI48MIXgK03DlDIPf8qJBUNdxdXRNLh0uxZ6uY0Tvg43nPhlFGpXM0Tzqi
 TR15A4cMhcvMXUPBVr9l9LRDshjWetRMG/EALyrnDx1lz6S7An+NKloyi6cMbV8Or9aulY+TT
 2aCgj6AbDj+oKK49t90OyDCpBxZOG/zmOyBhi1hzpiKxGjccBAuIX1+FUQ8wwLz5vCyRIBE/M
 9G0zLOa5O8gZopzacpjkuynINpNBaK/fLcdGRa3xW98fBvN6yI61u+xRZUzqUJ6ayD4ODm5Ix
 oldenz8LVQek6ot4hRyq6a3PqFecuDRMfHi4a8sg5YaNHQwq2ie6tcULdlzCOLjmqJNQy3/DQ
 9JVe+hxJ7D8ViLK4O2ElE1UScErJnBOllByP4iahfxbUu/42FtDHzME3U3gk7gc8H5xuVfWoj
 Vnu8PIxZJbwgVjMf2brEFB9BxdabF+r4GujZz1CRR5dP0iMTylu12toc1mYc04i/nUlR8HqV7
 tXTKXxthYRF9Cl4LW54zFjB3NTyUpxFb/BDb23Oe2fa1Xn8NnHWIFC4xSeil3prA2fE0e577A
 m4YJkIPii0xjNY40uoopgDfldg0Dgg0PwoLWbcObz9GjGsvjSDYAf8z4Zr90OF/O5u5682fGC
 QuOd83vXu5oViky07240DN3/Idd2gbeozvJOycZ2Bp0avEVvBvwxdH7zY8wraQoPxMHScGk0G
 x7AeLuzwuHf1LhtZ0T3BKUN6V/3yv3m1BC6+8MG/xrcRWck6i3d7s8wTuisXsOYZyLGcxZYX5
 cdr6ve5Eg1UdkA+WcCk+7xYxy+9xRoy/yNLqI32lvib9unW9DFonQDX676C6exje4YiPaHk24
 Jl0I5wS42r5TScLrrrgvaera8Vg=

On 12/8/23 23:47, Matthew Wilcox (Oracle) wrote:
> As far as anybody can tell, this product never shipped.  If it did,
> it shipped in 2007 and nobody has access to one any more.  Remove the
> fbdev driver and the backlight driver.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>   drivers/video/backlight/Kconfig           |    7 -
>   drivers/video/backlight/Makefile          |    1 -
>   drivers/video/backlight/cr_bllcd.c        |  264 -----
>   drivers/video/fbdev/Kconfig               |   15 -
>   drivers/video/fbdev/Makefile              |    1 -
>   drivers/video/fbdev/vermilion/Makefile    |    6 -
>   drivers/video/fbdev/vermilion/cr_pll.c    |  195 ----
>   drivers/video/fbdev/vermilion/vermilion.c | 1175 ---------------------
>   drivers/video/fbdev/vermilion/vermilion.h |  245 -----
>   9 files changed, 1909 deletions(-)
>   delete mode 100644 drivers/video/backlight/cr_bllcd.c
>   delete mode 100644 drivers/video/fbdev/vermilion/Makefile
>   delete mode 100644 drivers/video/fbdev/vermilion/cr_pll.c
>   delete mode 100644 drivers/video/fbdev/vermilion/vermilion.c
>   delete mode 100644 drivers/video/fbdev/vermilion/vermilion.h

I've applied this patch to the fbdev git tree.
It touches the backlight tree, so I hope it's ok for backlight people?

Helge

