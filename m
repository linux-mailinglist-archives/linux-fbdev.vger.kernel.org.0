Return-Path: <linux-fbdev+bounces-2508-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBB0907DD4
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Jun 2024 23:06:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7CDF284322
	for <lists+linux-fbdev@lfdr.de>; Thu, 13 Jun 2024 21:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5AA13BAC8;
	Thu, 13 Jun 2024 21:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="WnXGfIV2"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A847F13A256
	for <linux-fbdev@vger.kernel.org>; Thu, 13 Jun 2024 21:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718312802; cv=none; b=GA6AikAJkX+XWJq0jqV7OuUM7CHj9ieWn2/8q/+kF6vuUvIWY/Dtk/mtUNFTstigxXseay7ojYqdIvZxq8PgrVuwjB+7zM9BMvbMPluI2Z0Mo0d7tp1Lpiks2iz+tjKgFBRkej+BCeSPxN8u8V+OklUb6xTgbxm3fYOMCJm7T/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718312802; c=relaxed/simple;
	bh=VbsKgENJ3nJ3O3S+7c7fxSpJORZrm3j++AE0eJJhasU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gZTRsfC4lcpcmpqE0UNbSn047f1OvH/ICrIfoUx1lhktUq/qLdHweLEKtXn9yB0LNlU3xG5uxl/OriVmCgf+DIyVyRE8L7Z6RPVQ3mtaKvKPQp+lUyraiFJmhqAs3ojSkcfnqorJ2/x/VtvJD/OadcapZHvP9Aa2ANWyrfhYei8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=WnXGfIV2; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1718312795; x=1718917595; i=deller@gmx.de;
	bh=ITwk7WySaOrd5yfjYem/YIWT3S6C4qRWHKcP7yybcEU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WnXGfIV24axP2JRSDbisdOsNjNxf2jjmp98/wHRy1q/2DKltzV+/u1aoh9vRM0rO
	 lLv5X02aWMixsa4HaSj12CnbeorqrXToi6baBXjdIe8EsmeViMsC1k/25na4ng7WE
	 qfDK00LFx5LVSHST+zjFz/i1cc+cClmjUqqUbg+yqsfJGU7bRQMkLF39GdUcaFZUN
	 QqAFi1SXJgGebhOgV4RqG72cbtScDDtojiJJwgsMDSYAty05ULyZ+L/Ghvkulq6iD
	 MBhnr4HjkERQtv5yQlK0WYUTZvjWoP+YJbzNKm0LNgOX8Ko6yvpynzgzdeW2HiEZL
	 W6RVcMY39sZTuvbqzw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([83.135.217.92]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MHGCu-1sDTwI3rA8-0042sy; Thu, 13
 Jun 2024 23:06:34 +0200
Message-ID: <384f31e3-1d88-4374-b27c-4e7d8f0cd136@gmx.de>
Date: Thu, 13 Jun 2024 23:06:33 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video/logo: Remove linux_serial_image comments
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <427f78490365b38195f142d0aad7c9594a5bdd76.1718199686.git.geert+renesas@glider.be>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <427f78490365b38195f142d0aad7c9594a5bdd76.1718199686.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:da6QO1h1RyC6rasuZKzWFsx7J+xzBykhfS7rD4BXLF3kkz74zHK
 eVCfp5s6QQTFCfsHZitgRM8B/ljt0Wh42sTTB+vZfJNy0HHtRD7Ll6UdRJ1ceZuaostI0i8
 qvcaDBzvsUSb5zkgXwzxnn2BT1fBuNOOVGa0r6JLiMILJUs7vVpTlXsCimGMknwv1gJ0Gtj
 L0EWdi8srbFOKi011ixXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7X9Q4VtFepk=;YJ1y+IOKpEfFJSsf3etIY15SKIp
 dVpikQLVCbjQBrCWdoftjg6w7rd+hHjprqEG+JHw32UGftbTslBaX2/vCdUnGxwhdtPlYk/rK
 5rcwtW0lLOY2phqpE0DIp/7IdA2OsslQTaaQ7m+SrzkySlxkPK/eSJEgZRUDfxTULDF5k7q3g
 Tx8QWc9USD/lrr8SNGXxa49+D+PCEsCN6si0Ip7qQIoTr4bmomN3i4bQQ2LiKMFEBHND0rDPI
 LK6566LxqkQYJWWJYqiHTkdtWcvl2asmcedh7nmQwzUDz+Ut59ZjMQiWhNHtqQdJ3G7J35zdP
 Ni5tmdGcP3RqWoT0+lMUnNwyl0V+ft3J156s3KNCq9NpGqRm8+xF3qdVY383kXCmGcOprak6y
 9fknxgh0aTnpDY9ogSeOY0MFbC+ISyrmD2n18yj4Uu64Ndq2wT9XfwnpE9ZinSCSyoXnRQVL6
 puhf6mXFu+DVmNemqPhHBxnLvKvAYPWLgMGfAd99hm2G+36M4jsyWAnHjtq6t0YRybvfffjQ+
 CFxIG83X27tbp7ba0zLzkqoC35CMCovK3a/dI4lEBx9DA5RyStts1vIWIr6G90K4AbZe0vNd9
 hge2+ByV3IiCvwKNLhvP+uvTi/nUmXSSd8ytjrvLjgkBqi7pOFzxdABhiNLwiKEIVbE4ErNo7
 8YlNSvNfL/FVyXmnhQI6GOxB033D7uYxJ/lXv2cC9TyL2FHEZvBGT3LulhrmdEnuYUYSfrD6T
 ZTSOV656GMcgmsR80NyG9KP4mjk9V6lpLpEBBakdBrv9qJ659FAaf9rEaI5Iu1pc8jZ1awE7y
 wpMAIERWvHIsXABJYqzgNkK9PLF3CV8XNyF+Pl4GUgu1E=

On 6/12/24 15:42, Geert Uytterhoeven wrote:
> The last user of the serial_console ASCII image was removed in v2.1.115.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>


applied.
Thanks!

Helge

> ---
>   include/linux/linux_logo.h | 3 ---
>   1 file changed, 3 deletions(-)
>
> diff --git a/include/linux/linux_logo.h b/include/linux/linux_logo.h
> index d4d5b93efe8435bd..e37699b7e8393df0 100644
> --- a/include/linux/linux_logo.h
> +++ b/include/linux/linux_logo.h
> @@ -10,9 +10,6 @@
>    *  Copyright (C) 2001 Greg Banks <gnb@alphalink.com.au>
>    *  Copyright (C) 2001 Jan-Benedict Glaw <jbglaw@lug-owl.de>
>    *  Copyright (C) 2003 Geert Uytterhoeven <geert@linux-m68k.org>
> - *
> - *  Serial_console ascii image can be any size,
> - *  but should contain %s to display the version
>    */
>
>   #include <linux/init.h>


