Return-Path: <linux-fbdev+bounces-3158-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF00988C93
	for <lists+linux-fbdev@lfdr.de>; Sat, 28 Sep 2024 00:46:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 22CBE1C20AAD
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Sep 2024 22:45:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB8D1B5EB5;
	Fri, 27 Sep 2024 22:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="uUu0uLje"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4532187844;
	Fri, 27 Sep 2024 22:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727477147; cv=none; b=q4QGcBI744c5D2QftBmgX5YssYquXgGwI5JVj/xaNfOmSUZmgNeARgXUzjmKcN5vEKfNWgOR5Kw6OS4Al22FNCFYZ/J9bSBcwpcUSE+nShi6vuxpTHUigEI8oMe96a1aQ+oO8BjYiC4dz0QMnqABhrGyePnRiWC32BQWFxbWvNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727477147; c=relaxed/simple;
	bh=SrrXd7yijovg4qbm3DPkekQZ5EmbpQN8ylq9P9eX+W8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNwtAwecqe93DDBIoHg+6S/4R314qCLHqurKNClE3QvGcxBLR+bZVoZ/zF6Lie5xOuu5BZ7kmhmwC3GB/doDejtFSKhrUpQ6mWI2ZQxa4NiL6smtK418WKLqJsvHy8soegUA7H9C03WkE4tCFHA48KG7nAq6eb3/TT5qTGqgKyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=uUu0uLje; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1727477128; x=1728081928; i=deller@gmx.de;
	bh=+dHwecBIGg3Joh9idb0HFBnwx/TWcgxtGlnTZgL1Fb8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=uUu0uLjeGZn/g6y6YSPbR6YB6qaRe3pNhJCnt+RdL78RZxB24OSvtZWLvxBeDpws
	 pNx/1gYztAFPkvfzIMmR7fr1oQmZqyA3u2Eg4jSrA8+gepeDhqP9bWV3Pp46/eRQq
	 jEG/p4Qd8xVMkKHfZjR1Q8chWfU7vA6KNbZstQYtsIrP744mS5lAoD0ucOJADVuV1
	 Ve2Y81NJWD6pc/N9yeZR0KzXwbJpvraPxQvdH6i83E6/5nKKpVqThPPRhwk+amAI1
	 cw46M7wqVJl8u8zdjvrzIZlgKIdku8yW+pqpVU3Omu7HZhtz9hSAo/AEamOubL7fJ
	 NIw4Ar1s9o9+Jlf9SA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzhnH-1rz28P23qz-00zF2I; Sat, 28
 Sep 2024 00:45:28 +0200
Message-ID: <db1de78a-8846-4fbf-9923-98614f60e73a@gmx.de>
Date: Sat, 28 Sep 2024 00:45:25 +0200
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] sis_main: Fix strbuf array overflow
To: Andrey Shumilin <shum.sdl@nppct.ru>,
 Thomas Winischhofer <thomas@winischhofer.net>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 khoroshilov@ispras.ru, ykarpov@ispras.ru, vmerzlyakov@ispras.ru,
 vefanov@ispras.ru
References: <20240927193424.3934247-1-shum.sdl@nppct.ru>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20240927193424.3934247-1-shum.sdl@nppct.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pCmyMRGPD3DNsO2nzlobMSmzVIrYYCtn1A9wdCNAy67CwSNyqQq
 Nm1uJ8D46LF+iRZuFKHLdSFdJ4x/HBP4iDeXMkyLSDwYCQfHmldajgAqXZ64i1p1QPPivqY
 7g4/b11rcg9wEta2+27eshdGv6UAHQM6U0ndpz77RIZRVZ6So82IivgWf8vR9TeSiWnJcFo
 jwFKtLXf4lti8nhpPgO0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PfPZZ7CPJSQ=;kK6miyz9JF2cGTm/FkqmnGcVfTo
 b9zhUAkjw4ubBKhWoJERYCdcwwmB9OoqQXUgv5CWj/XKzbIgyjOkNO+TUTWSz1J1degPxwrQ8
 DmC4phatYmN/B+HLIqpPkpUoUc/7EdTy5XaG7weJoEIUBlWSaHjNhJ9fxKys5mQhDcgECYmuU
 3Zcq9xbPzfIUcrJC9qBvg2Rwhu0wMkl0Ggka2I2+GeT60AbSBRk//7vpN1q6Vnka1m/kirYqx
 S/lsWRUupPdwzTXyIFMU1LDX1gdbeyfZAyEeankdX/L61XrzpyLMTexrDLU31BS9LuhbQDl7t
 wFdVKa0QZUVIIFRxdFQor7gyDFTBnq0mAjtyTPp0IKDQt+ukE8Jq6t+MFSgzipDQj5B0bwCkZ
 TSeYgtBAWUoMe9qDtz+51gJklSgLEMSJ+EIMm6h6qLcjjaNH7Jqrsk3bhWKtAbc4MANZgkwrp
 IinAxMP8vowvQLB6FcyaGtx4eBqjqLAqgeq1LIjD6OjYSBXFaFihFDrRkx24WpTvljUGZSqSa
 73zzO8j11dvd0Xj7jJhf4WnbH1/xPZCkA9KFYbLaxeZZvTsJa6cOvPwe0B1RIcom+8LFbfsD8
 jtkRoIsIAbdMVGEE6+YQZSHjiCTiycygbnFAmQAdvoG/BLvNg2oMGg/KMgNqfLNNQDTRiX/xv
 CllqQLkzIDJpoqbXZK+0pEXGfv7baha2WwTGoSuA3MufcXiHrBxHqbdBlcgH8eHVsZauIJal8
 rsyHhFKA7tfV3qI+A2ONR1Z5KzrPZC8fS2JCCBo1prZ1RM5oKd7zh5Ua2zS25x1HBOCZjzS6s
 Jwph/O3sV+YTluCT+oWIhuTg==

On 9/27/24 21:34, Andrey Shumilin wrote:
> The values of the variables xres and yres are placed in strbuf.
> These variables are obtained from strbuf1.
> The strbuf1 array contains digit characters
> and a space if the array contains non-digit characters.
> Then, when executing sprintf(strbuf, "%ux%ux8", xres, yres);
> more than 16 bytes will be written to strbuf.
> It is suggested to increase the size of the strbuf array to 24.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>
> Signed-off-by: Andrey Shumilin <shum.sdl@nppct.ru>

applied to fbdev git tree.

Thanks!
Helge

> ---
>   drivers/video/fbdev/sis/sis_main.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/video/fbdev/sis/sis_main.c b/drivers/video/fbdev/si=
s/sis_main.c
> index 03c736f6f3d0..e907fde96ff4 100644
> --- a/drivers/video/fbdev/sis/sis_main.c
> +++ b/drivers/video/fbdev/sis/sis_main.c
> @@ -183,7 +183,7 @@ static void sisfb_search_mode(char *name, bool quiet=
)
>   {
>   	unsigned int j =3D 0, xres =3D 0, yres =3D 0, depth =3D 0, rate =3D 0=
;
>   	int i =3D 0;
> -	char strbuf[16], strbuf1[20];
> +	char strbuf[24], strbuf1[20];
>   	char *nameptr =3D name;
>
>   	/* We don't know the hardware specs yet and there is no ivideo */


