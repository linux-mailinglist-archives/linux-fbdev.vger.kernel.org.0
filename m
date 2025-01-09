Return-Path: <linux-fbdev+bounces-3562-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9A7A0696D
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Jan 2025 00:30:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 946A13A6DBA
	for <lists+linux-fbdev@lfdr.de>; Wed,  8 Jan 2025 23:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A916202C58;
	Wed,  8 Jan 2025 23:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="ZgcAoISw"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F5122611;
	Wed,  8 Jan 2025 23:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736379033; cv=none; b=ceiBFhFq1WuYcP/PwrsUCWTofsnTH9WxvpF5mayjKqoGps67xaGaT9v0hpQB3pGUYhTbshc0qrcRJQ4D20N/0xiMRt7LSrtwDD8JPOg3kPx03IiSMSIH6GqgktLVM1evcq9UtMhBlmpThg2lKAjutHLFxLoHQM8MpU9fYPH/qW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736379033; c=relaxed/simple;
	bh=Y8XrRWHeT4gjfJWwOIqN4ERHN1znGHVBZgBx4/uQ54c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rCdaqCKce+Fs4bISt4mMHUWOdZh761fobiZiOm//ebqD+cX4JzujNFwP25cVvgXSJ0u/R+2E1bwybl8y/SpdfwikAY9GlIKn9w6PA0IuLT8Bqsdi3a70SRRWYjdt0cLCzk8KctcMnI5ZqyyKxD72MCruxpKvKwHPB+YnivnPv1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=ZgcAoISw; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1736379015; x=1736983815; i=deller@gmx.de;
	bh=Y8XrRWHeT4gjfJWwOIqN4ERHN1znGHVBZgBx4/uQ54c=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZgcAoISwCEzF/fCUCv5ACwg4dMhujdVPNdUBx80cKJw7AsNAgwqJRAjjQ8EbtyB8
	 cDkAY5pAMfyKBbUfDk9BOkHf3YTIjNnxgc7lAEoO2lyCWHkjVeX57wMazAcjYppuo
	 TEDZJM8BEE+XEqajoCgbtt2fc46aff9XZ7Xg9tLFmnGX0B0Eh3v5D8FvcSPD2gIyH
	 qlNnMWWKBFzoy7Baf+5kShNe6nqylhuLcQQLpwBGA20KgbzU6w6iPBHJABaiFBObm
	 tHZM0e+AF0yjeSNgaaQhVlsB1Me0wN4FBSMPiCKevbuijDVFpZMaoxTuH1HQQbI6r
	 bp3jHwwkv1xFyrfX0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.172] ([83.135.220.169]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4Qwg-1td3oW43b4-010eIU; Thu, 09
 Jan 2025 00:30:15 +0100
Message-ID: <6af29f19-2e8d-4bc8-a9be-f3a0e229c7ff@gmx.de>
Date: Thu, 9 Jan 2025 00:30:13 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fbdev: efifb: Change the return value type to void
To: oushixiong1025@163.com, Peter Jones <pjones@redhat.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Shixiong Ou <oushixiong@kylinos.cn>
References: <20250103032633.98807-1-oushixiong1025@163.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <20250103032633.98807-1-oushixiong1025@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9KSBuPZedUe1x3s/ybDNUzrvuSgRdsHT6ioSwhVhIPZIelYH908
 qgwXI6c7DJ78CH9Q69x7OJVlUmf5GfTlDik5uA2DAj3f/rhOIBieQEEn6YK3eEmP1thMO2M
 /VBNoCIN4yYVXQxccZRuK+bT5Mp672fNWBaDWfwfoZn+5ziro9GMmqUQAuYH1m+/0FI+3Gv
 NyfHdkm86S0aC7akY5YRA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PufQYzmlCkU=;bY/7fy605GO5du2qG6D/eyVnrBx
 UREkb2Z6E6gbs9uYz7RgAEg1IUIC1TrTPJfW83i6L2phBcrjAROZLpjAIOeTbQjJVHjZ8n3wS
 Mp98+YUGCMuB7fG42CGPFvs4IOwsINd+cZGLxU7clQ28BS2v/f6/YwUi3XCImW9OTB7xapoAG
 4uj7H4mMZ9vz1FU47NTP+QHrcaaCBlo1S16ephthTYsK9FY6L+gPnv2f/LZqCxLQzL6vVZcwg
 64mnJ78GMCwCQ2rs3chkDUGOjuhgRA88sD7zL+Gb6bSN0m+NVy7sVgVTexjGsOJzE2uQJj6Wu
 rLDh7dKyI1cW+E5jzp0dZpcpWMZqXcbeRtVl93RBHmS+YcGRyDy4Pq95c/3M+OvOgCBLj1plG
 j/5XnPARI42xB1d1MVp5uqV/fKLQXvpDuw+o5q6Dmubctmk7i2g0DxP5asSHUon1tlpGPECfG
 GLpV/dnO0D7i+EPaJQybvjVRrS7dRi/vKIz1Nk10mSVNkONuo4paYrwQxnf+xhsN00t52Bx2F
 thxkzJ9NwFWOqGqw2Jf/9+3PQLQygOn5Z53jpdje2T/9a736NUcFEWau85Xc8rNrGOWYAOAFP
 g4wir3FxaPxQGoAai0xhAnI7DyEOZ5+ipH9QBntK+CJsTqFY0juZzxLMFo/BCTy2o0Oq8PYc/
 0sz/Tdv/XVXx6WeihE9mtypSx/1phDAGe7H4zNBeLUlDOtS4pQJXpE/qaWSXXX1lTqJSd88nQ
 zogKh38M7OSEH0U0lGv4sTEl39MNdYzMPCT3D3I+737MU/r645SC+6sb8ovtNbJlqnAgrHY+S
 f2MgMnVQbNHBka74HT9xhWuQ8ACQfxwiupR54clJ67EmXK6Uq3R/yf+txI/MWYGPXDERRYxQY
 MwigDukux25ePMbJI4B5AT7+N7yPRnmZ6BQ+ohxkyoSDK3v4AWNA2EsPcNH0ADTswd65iEddu
 NEKUJHoOXiz5LD+eB2vIRsW/WuHYRjZGV3hoCZr7+KQ1VhY2QDaF2pyGFPPqj13iKpbI9sq60
 HM2LD41QffTAfPIfdfgv01EsZG5u1CWdAIi1KKMqdn6D7DmgshI8p/jThQOU5se6eFmffiTFO
 PeGaZvbJ3efFwt75lndsRruoEisF0A

On 1/3/25 04:26, oushixiong1025@163.com wrote:
> From: Shixiong Ou <oushixiong@kylinos.cn>
>
> efifb_setup() doesn't need to return a value.
>
> Signed-off-by: Shixiong Ou <oushixiong@kylinos.cn>

applied.

Thanks!
Helge

