Return-Path: <linux-fbdev+bounces-3506-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 996B19FA445
	for <lists+linux-fbdev@lfdr.de>; Sun, 22 Dec 2024 07:07:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11FD11655C3
	for <lists+linux-fbdev@lfdr.de>; Sun, 22 Dec 2024 06:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2C913C9A3;
	Sun, 22 Dec 2024 06:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="kInoV0i8"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222C5149E00;
	Sun, 22 Dec 2024 06:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734847667; cv=none; b=ThvK8QDjf0yS278b6a0uPPPKW3lf2vb+9j1YRPouWl1IeeGOUUiuE+Wn+Edfc8P4dH/JSY4berhMm3FbQyFvtWek9QSouKljssdtfaefSBX2J1ViqMkexWpzZhtc9Bekw604O9h4ynIQEP2qr0hl/gkEbrfHV/P32rvV27NpJUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734847667; c=relaxed/simple;
	bh=vpCMwTEgXlJPC+jWq2nPICl43M6vapl6nv126j60/VU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rRC11A7uszIoPg2RnQTdHoxw+V2sgozqsgPrAaNbl0N8kggLYiqv4TWlVin2psZcZO99/XzDOrcEX1FmdjHx1Ak2rUVEujs8oyNYroOrrXw3H1z2w8S9S0voEGYoAzb0M/t/RQM0CFUwBE15uvqkYyIzZCMrBcb0gMu5A5RQvks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=kInoV0i8; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1734847660; x=1735452460; i=deller@gmx.de;
	bh=CGJ3JKoy7U5P5XrwETlirEe0q+TEVp2dvIUIrvkoxp0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=kInoV0i8vMOsIUdj5rSnkRopjQR+7q7hotHNmYysxFV2NlOHW/scArvmWhw3IQID
	 5z6wWnk4OXojs0dYZ6iHNz+Lexfpq2g7dxAjnn7qf6JU+0SYqWqq80kRMxWmQtq56
	 NUnS11d1Hh3Mpmd2Cs7wAyL/aQXSGiiYZp1RhufsQ/zYtlqaoZWjHZETJKCFUMRbs
	 XLkh7w85xL0PH1uWUDCVKuOd6S9guQ17I6H1EUdyJmJEMk6j3+PwmxTTVHjVTcwmT
	 674hol7rXgMCZMbnPHY6p0sLk467jafyFMkLZoZo7bo8kqfUUKFIC5WKSdQphJ03j
	 xYS5w0NJNnx+JxbMjQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([109.250.63.155]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQ5vW-1tC87w1MjQ-00RAhJ; Sun, 22
 Dec 2024 07:07:40 +0100
Message-ID: <c016ff53-423f-4635-b225-c6f3b2837ded@gmx.de>
Date: Sun, 22 Dec 2024 07:07:39 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] video: hdmi: Remove unused hdmi_infoframe_check
To: linux@treblig.org, linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241217013859.2132527-1-linux@treblig.org>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20241217013859.2132527-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:rlpphXSBXP2Qw4FDgUiL7J76MTzhFGcLeVVGHhzlZTIzfg9tqVd
 GzAG6c1JASbAY0ewgwYaFykrO3pGKWMXEOy+/659cx7NcDxHg90tAkOP0LZCnqDAbk77Jag
 xEKYVnlXLkk/4K7qVID6PO0oBvHK4zmTwJM1Yi3p0pmQ5Jd6RSEjoyMgdxSquFeuk4da4iQ
 /dCX6UPqEJoskJ9p8Er4w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qQHQYN0vDrQ=;M1arzcvqFeHArGsFQOi+tZZmFC+
 aTihnXwYeTwXybh4LkQ61bR+hI96lnLu7k0ZEnsd46cy9J3j3MT8CcyKf0uQMcrECDNHwNp6t
 NUxln/yWiL4VOXQyvrWcmlrD2+AqV/U7m55GqvI35SO7r8apB+cle+GkU+4Z4Co+dGrF+bK2k
 rknRuonEjNYlJ3r6D/S9Vc+Z12u2nK1dceVIRJfd8cXJWxZ/iO91073MUV4tp3shVqYb/tEQ4
 qeoBdDLAaCNH8fHXwca9unNs4EeUqjZHb/UM6xshEAv7nw/QEWpEQNkPLJDxxA0pqpKlfWrHn
 De0qzjjmG8DpzjXfr6XRBCwJv4D+5KC4xo789BVTGnJPHrYkX0wIRcKOVfMiGGI87unyw+UNY
 wxTshISgvhXYFDUxnlgOrHQUe8UkeoKbKMCzXQ85EdhycHd15fRAkQBRFrsPlsmye1hdBtFu8
 KnX2cJ0hXEb8dG2OsSKr1gjgIgdqOWiV4KBFaUkf8mIEYU65eCwcc4YetJBZx/S79b1km0jhr
 c8z/oVp/0VGNscQt0tvlASD+8qFNYLcdBKuWRA4+PYhdGbRWEvUk2sjKqksU3l+/jxZ9G3YkQ
 Q2lkcdtkiZjH8zLQcxq4nxYhJTQSvzh1Gh9w+McseybIUXirxXsngCw7TuwI/9lhcTNHLcIsG
 sUDO9iA2dHNrxMNe629+1JwBFc20ycsxKgwcAUoYI/2IuWreBnZeXP08Sq6EzBkQpuaM0bY85
 w0HWoR9xFftLzjpcODJukIKtwvEziivSe+u79acsFGNwp+EOyfK648HJodZHy61m0ekMh1QFb
 EvtEuBv/8RBk9G6ZH5a5JtltnrJw9ed2IGX4IPVgpwUE6cSvEx4gnO//AJrfy9qUFXlByYRlc
 McsvwvxehGuJlHy0XnJ1HnYcu99iHWfoRHrvvJHf5oIa2ENtLJy6mgBVJuyqoTOalr/WUg+2g
 C7dq3jK3Suc7whkv0IqTOgoY5i2ZQMv45a5dTLY3l3B6ELEpakc7M8cIU3tVEvp7v5MSiJlGu
 ScGWCpvddQJYq2TIsWROhI5xeJCmy49pDzGxO9JpEgOClx3sOGnIZDDUK+GhobKWw+AC9EYeP
 biQjExh9+BcNikmXEcW5+zfVFzFQeh

On 12/17/24 02:38, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> hdmi_infoframe_check() has been unused since it was added in
> commit c5e69ab35c0d ("video/hdmi: Constify infoframe passed to the pack
> functions")
>
> Remove it.
>
> Note that the individual check functions for each type are
> actually used, so they're staying.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>   drivers/video/hdmi.c | 28 ----------------------------
>   include/linux/hdmi.h |  1 -
>   2 files changed, 29 deletions(-)

applied.

Thanks!
Helge

