Return-Path: <linux-fbdev+bounces-3776-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C554BA3085A
	for <lists+linux-fbdev@lfdr.de>; Tue, 11 Feb 2025 11:20:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8328C3A26BF
	for <lists+linux-fbdev@lfdr.de>; Tue, 11 Feb 2025 10:20:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E038C1F3FF5;
	Tue, 11 Feb 2025 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c62b5sBk"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8641F236B
	for <linux-fbdev@vger.kernel.org>; Tue, 11 Feb 2025 10:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739269231; cv=none; b=o7cQIa/20/qpbX3LNcPrxozVykUCBGDepWcAcZ10fhWo4qm6UK/UAlFgMLrZcaxBwAQbAdojHzxhhJHTiIf55z8JqtGfLv1UDyyRQR3M4IajecZkstqf35u2rCCQb3tgQEXrI5jKq/vMZGGkcHztyXNfFP0Q8a0KcFTv0WPGJ88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739269231; c=relaxed/simple;
	bh=QHfZqMJZ1yfRice3bDVmQNePWNNfSPPYnsH4pN7YZKI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=F//VfeSEBs4bZ7sI2642iRCWwoAHo9IASqG+KvU98ZwR72bLJD0ICY63fvSEC3i/a051mhoCp0V3oZTrexJwPe6FgIQhEw9RXUhecZFkiyxzsMOhagUQoB4yjYrohFuFtnUiLeRaZcppSJf7JxHe5OjMD8elpRQy3Nhk6MTJEFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c62b5sBk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3F9EC4CEDD;
	Tue, 11 Feb 2025 10:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739269231;
	bh=QHfZqMJZ1yfRice3bDVmQNePWNNfSPPYnsH4pN7YZKI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=c62b5sBkHUoP8ABpLUeUYnlQdwhyrmtdRJEre5UOus36u6FNcn0F40aKUj5ci1vAR
	 D8EMeqY+pqyI6N/6DCH/OenSdAydf1Gk1BEvMxRnaJJ3753vAnh22sb86CArRdXGO2
	 NTNiBUPM8lkid1cxCwLJbxBv76lPvAuRk/GDde3tsUhlNPrZS4ErRRnRV0Kk+pvG3z
	 78UCFIG3/jb4WWfkdyaB1PvxMZc7m8FOKaJsse2VpoVISUUDG3DnsEHdbdaeQk2X4I
	 jQv+57jILkus4xto9j8c7xuufVpYNlD9ZqG4qbe4hJI4rVbOd3VHfzGbPi8RIR0gn9
	 d4FB/oX3NmztQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, 
 michael.hennerich@analog.com, support.opensource@diasemi.com, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
In-Reply-To: <20250131140103.278158-1-tzimmermann@suse.de>
References: <20250131140103.278158-1-tzimmermann@suse.de>
Subject: Re: [PATCH 00/16] backlight: Do not include <linux/fb.h> in
 drivers
Message-Id: <173926922945.2064331.4417872874243504252.b4-ty@kernel.org>
Date: Tue, 11 Feb 2025 10:20:29 +0000
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Fri, 31 Jan 2025 14:58:31 +0100, Thomas Zimmermann wrote:
> A number of backlight drivers include <linux/fb.h>. None of them
> requires anything from the header file, so remove the include
> statements.
> 
> Thomas Zimmermann (16):
>   backlight: 88pm860x_bl: Do not include <linux/fb.h>
>   backlight: adp5520_bl: Do not include <linux/fb.h>
>   backlight: adp8860_bl: Do not include <linux/fb.h>
>   backlight: adp8870_bl: Do not include <linux/fb.h>
>   backlight: as3711_bl: Do not include <linux/fb.h>
>   backlight: bd6107_bl: Do not include <linux/fb.h>
>   backlight: da903x_bl: Do not include <linux/fb.h>
>   backlight: da9052_bl: Do not include <linux/fb.h>
>   backlight: ep93xx_bl: Do not include <linux/fb.h>
>   backlight: hp680_bl: Do not include <linux/fb.h>
>   backlight: locomolcd: Do not include <linux/fb.h>
>   backlight: lv5207lp: Do not include <linux/fb.h>
>   backlight: max8925_bl: Do not include <linux/fb.h>
>   backlight: tps65217_bl: Do not include <linux/fb.h>
>   backlight: vgg2432a4: Do not include <linux/fb.h>
>   backlight: wm831x_bl: Do not include <linux/fb.h>
> 
> [...]

Applied, thanks!

[01/16] backlight: 88pm860x_bl: Do not include <linux/fb.h>
        commit: 9df4477179f1af4ff7adbacfa243819b57134b9c
[02/16] backlight: adp5520_bl: Do not include <linux/fb.h>
        commit: 769562042211e7a194e3dfde9436b42a3734e279
[03/16] backlight: adp8860_bl: Do not include <linux/fb.h>
        commit: a84877d7cc5b38dbbaad94ea7f8a784f8b12dbc8
[04/16] backlight: adp8870_bl: Do not include <linux/fb.h>
        commit: 1eeab5c83aa3c14790167c4d2b8786b257651bac
[05/16] backlight: as3711_bl: Do not include <linux/fb.h>
        commit: 9800ca9c96bc039a5e19391c446d1d69b211756a
[06/16] backlight: bd6107_bl: Do not include <linux/fb.h>
        commit: b6c775af0d2f1cf9376261180ce13e997dba583b
[07/16] backlight: da903x_bl: Do not include <linux/fb.h>
        commit: 68d112e043a4e9a5078eebc9302d5510d458681e
[08/16] backlight: da9052_bl: Do not include <linux/fb.h>
        commit: d670a4da1c60ab1004b79204c09b221eba8af93b
[09/16] backlight: ep93xx_bl: Do not include <linux/fb.h>
        commit: fcb0283338d760d37cd2701f6cd2bba0f5e78eb2
[10/16] backlight: hp680_bl: Do not include <linux/fb.h>
        commit: df14455987587fb5373eb216511e0f3ab24c5480
[11/16] backlight: locomolcd: Do not include <linux/fb.h>
        commit: 5f02729fadee6dedb638cdb8244f9447c8ad4ef9
[12/16] backlight: lv5207lp: Do not include <linux/fb.h>
        commit: 8c71b34c636cabb4101098cc6bb619ded9b0905f
[13/16] backlight: max8925_bl: Do not include <linux/fb.h>
        commit: aa021f33d2cb5061a2a02e1a3c8faea3a3d2f844
[14/16] backlight: tps65217_bl: Do not include <linux/fb.h>
        commit: d520ae4707fd6dafcb55649460059f67f54fc743
[15/16] backlight: vgg2432a4: Do not include <linux/fb.h>
        commit: d023cc09d9dbd5c6a4a81e0e3866c3b976d70891
[16/16] backlight: wm831x_bl: Do not include <linux/fb.h>
        commit: 373dacfeb55e1ac73dccd91b83437183ca0fbd43

--
Lee Jones [李琼斯]


