Return-Path: <linux-fbdev+bounces-2665-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 80913927A6B
	for <lists+linux-fbdev@lfdr.de>; Thu,  4 Jul 2024 17:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B173F1C2408E
	for <lists+linux-fbdev@lfdr.de>; Thu,  4 Jul 2024 15:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281411B1415;
	Thu,  4 Jul 2024 15:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M79pxWxm"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DDF1BC23;
	Thu,  4 Jul 2024 15:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720107962; cv=none; b=aQoC96zrXMWjRxkCY81xkPhmvoYRlLzPwOLCVGJJHEgW1lrtlZiujnGrIgOO4yQjV5bk4GZWJTpqXhmXW6dWlDqUth3bYjOHcbIoRSZ7pvo2nrXItC16d8/P8SERrLDuNOJiz0ncXRDWYKx491U9BfALekiaFt2s/WGpw1Y9P9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720107962; c=relaxed/simple;
	bh=ikOqTh/MUlIZlNenqgKLen74t9yi5HfP2j1aIiu+p2c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=PbGMwueS1yhZLQL0UIZbYG3lytPgYZMn//KrFXd5eCQ9F6lDIZ1pFtwyWgWpgbYv7sELHX2LLykTkmg7JXP+KHF9q0kgheDoa5QlatTcjS8BI5pq6vDKhwnAP+A9uBYP+2emIE20yH4jCLSZWz6tVVRfP+po/vxvNv+Vd0z+kSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M79pxWxm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF0BC3277B;
	Thu,  4 Jul 2024 15:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720107961;
	bh=ikOqTh/MUlIZlNenqgKLen74t9yi5HfP2j1aIiu+p2c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=M79pxWxmvR20BDCjHvKzcsgsT1LIbfvpngUCC02oPX6v+Y2srb89pSrp3fccLxCBO
	 SU3mS+j37mhQQYlLmjwuU7f6Jf3pEcAFQ2aSx5+qTYw8nVdfCSUmb/ZXFPxrLUq6iN
	 Nhrq3DmaphKiBgmnDKEkGl6hgHscKSEe/+VuD+qtsa1gjFV+TWEkIp8iATOJDMIWO8
	 LA0TotsZ4+rHRNZ74n36LNdYVDrS8QCHTIo7ZQVPqZOdff7Jog86xAPFC4h2C54yNQ
	 QNFqnx/bowx/0494Gm1k2A3DulJO8Tnkq0induXo3w8ks8htsLoQL3jUbi31Ornl3p
	 Q8FF13SfEsG+Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, daniel.thompson@linaro.org, sam@ravnborg.org, 
 jingoohan1@gmail.com, deller@gmx.de, linus.walleij@linaro.org, 
 f.suligoi@asem.it, ukleinek@kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org
In-Reply-To: <20240624152033.25016-1-tzimmermann@suse.de>
References: <20240624152033.25016-1-tzimmermann@suse.de>
Subject: Re: [PATCH v2 00/17] backlight: Introduce power-state constants
Message-Id: <172010795899.506663.6662347475872437728.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 16:45:58 +0100
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Mon, 24 Jun 2024 17:19:55 +0200, Thomas Zimmermann wrote:
> The backlight code currently uses fbdev's FB_BLANK_ constants to
> represent power states UNBLANK and POWERDOWN. Introduce dedicated
> backlight constants to remove this dependency on fbdev.
> 
> Patch 1 introduces BACKLIGHT_POWER_ON and BACKLIGHT_POWER_OFF, which
> replace constants from fbdev. There's also BACKLIGHT_POWER_REDUCED,
> which is required by a few drivers that appear to use incorrect or
> uncommon blanking semantics.
> 
> [...]

Applied, thanks!

[01/17] backlight: Add BACKLIGHT_POWER_ constants for power states
        commit: a1cacb8a8e70c38ec0c78910c668abda99fcb780
[02/17] backlight: aat2870-backlight: Use blacklight power constants
        commit: 26dcf62333f1c1ec33a469339a287ab8eecfb06e
[03/17] backlight: ams369fb06: Use backlight power constants
        commit: 1adf98242e0ec33f15c4f7a1e86ad76abf209665
[04/17] backlight: corgi-lcd: Use backlight power constants
        commit: e263c051910190feba884179aef15e548273a7aa
[05/17] backlight: gpio-backlight: Use backlight power constants
        commit: ef51815c5f970b228a775ceb3bb06ce46fe9ff86
[06/17] backlight: ipaq-micro-backlight: Use backlight power constants
        commit: b6675c59473a26dec33281e4e872cf09f6321523
[07/17] backlight: journada_bl: Use backlight power constants
        commit: 6910d19bb861db0721a171f4e351c290a40f1d19
[08/17] backlight: kb3886-bl: Use backlight power constants
        commit: cebc25971f7f988dfd4d6c7269deea4c1ca5898e
[09/17] backlight: ktd253-backlight: Use backlight power constants
        commit: def5831f09db8937218be50fc652d20c0a68e417
[10/17] backlight: led-backlight: Use backlight power constants
        commit: 814d3e820039348f1467ada9a8a812c0b80733de
[11/17] backlight: lm3533-backlight: Use backlight power constants
        commit: 761c83910b3d10e731b03438b883d271c295a9a5
[12/17] backlight: mp3309c: Use backlight power constants
        commit: c2d9c4934bf4e12b531312bbf02a8543f6a23aae
[13/17] backlight: pandora-backlight: Use backlight power constants
        commit: d4db2f193490415386ee13f714a0940943cbb149
[14/17] backlight: pcf50633-backlight: Use backlight power constants
        commit: eca6b3ddfc554a9a51795cf035ccd60f2d842074
[15/17] backlight: pwm-backlight: Use backlight power constants
        commit: eb1c4b6ddde6867498ead8d4b92d6abb5f736a7d
[16/17] backlight: rave-sp-backlight: Use backlight power constants
        commit: 22f8a85ef0c563ba7e53d9ece39c1f2dc99f53ed
[17/17] backlight: sky81452-backlight: Use backlight power constants
        commit: 1df5aa3754cac2045998ca505edb84d994786c67

--
Lee Jones [李琼斯]


