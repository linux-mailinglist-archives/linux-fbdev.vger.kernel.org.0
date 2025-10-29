Return-Path: <linux-fbdev+bounces-5196-lists+linux-fbdev=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AFDC1A1DD
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 Oct 2025 12:52:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E724E404923
	for <lists+linux-fbdev@lfdr.de>; Wed, 29 Oct 2025 11:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72A3C338F54;
	Wed, 29 Oct 2025 11:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O80e/tCm"
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B792337B8C
	for <linux-fbdev@vger.kernel.org>; Wed, 29 Oct 2025 11:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761738676; cv=none; b=d2LlP+6zvNr1EP6q6UhfYULp8oI3AX5pGqdtKePVHB6rPU3f7LZuniXTD+IQQIB+2Ns40n6aHpTfrOEdrrOhlXLI+dAb66oz+zJ3tXM3TY3iMlHwN9GSMrWx9qTtJc6ZU8jE8Mx0TwTTABCJ8p/5SNwn6ce20+Ke/2otFLc8MUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761738676; c=relaxed/simple;
	bh=sQSvCc+stRawyQCe28tVgqjb9XQM8BEV450CLz359gM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YsnEkRaKxkwSKThHXzfmvQupDqDaVWs3M65QTuZztlqkR/a0ipgpgx7A6lrcAFfDHOMxErKH8xRqezgg7TKvJY6CuTrcCStx1YzFCcl1bz5V+65DqbccD755S3KwF6V/C4LlezG1HQ01aORo7IRnKALfAz4r+o328f/KduWQmig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O80e/tCm; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-63c4b5a1b70so13716350a12.1
        for <linux-fbdev@vger.kernel.org>; Wed, 29 Oct 2025 04:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761738671; x=1762343471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6PmxXZLeWMcLI527g8jLuWPGtFvEcXvUEe7TnxQd8UI=;
        b=O80e/tCm6+Iat8kAqUO18bZedek439vALlI22gIe+yJlliP+ULIePafq5C+cICvVHI
         i3J141tK2p5XqA/zUYmGU1xd65djsLQVkF/T2Y9olvkuVemCnCMgmPPC5HZ8qNEj9mnm
         8v7By0MDj3KVPZunHBgtSYNcg21xZO/Gbg+R4YdOIv0Aimoc9OfwLLZSp+NrJk005s86
         ivGR/04m+ReFF3chCNv9Oj0+Mn7ABXbCJf21OoIKIoXQiWiULihs4dyBVmyjozPiPHZX
         y9Wt8T83MDWuEO/p8XgL0nNVp5iqI8gnHX7rGbAdMfqCuVx/t9g0OTs8H21w8wXbRfci
         /fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761738671; x=1762343471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6PmxXZLeWMcLI527g8jLuWPGtFvEcXvUEe7TnxQd8UI=;
        b=rN84ijVwls2j1i5kN1e3op0Havfeif+t5olCHrWDU0J0CkUUKuEy/00C8PCFcVom25
         m3VcBVzs8QsFJzHNSLp0/obUhpWz6hQJo3i5sO8dN9tarmIc+/WJ+fdCE7FZpVDAIp0G
         DuaiJ4j11e5CN/yn2u2+7yhwL/wYMAPISmS5zo5WJJnplzS3SrMhtnR+Fld9wxpUtDXF
         qc74w1ecqKPuLGLvPhWlt4x31QEXSyI+h0qzIe/hQ/rpvS7wOCW8r5kv4zNf6AMwinvk
         CSnyH3RMsJhSu7PdVNrqPOg/iYE9XmgTbA5L+eGbwxUgmLWR5MdttFHFHNqLMCAUZS23
         EIhQ==
X-Forwarded-Encrypted: i=1; AJvYcCXw09wSaPfTpJiZoxaGPKQQj5Zs5zmAlqByqA+W3VBwsxL2V1Yr5RtzVQOBJuE630meWi4VhL2lB0kZTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKrwOPjbZgH6fUMS+lGCcWwGSD9zGzkBgbHhDTwfjF+jDDWKxV
	GVSlKYJYV0fbeUmwEGrGWri2rq8Z9cyv5c75TjlmHztPkUu2Fgg8tdrPhwiS3IgoZ3J8aEe9ost
	OuIyxbZb2T+jqMr0N31NgWWwS/8UKjQA=
X-Gm-Gg: ASbGnctBx0lbNMJiKJTy3t2tGpjQwUOIcrvo/9zcH9IUj8olsBFJBoVKoKlkl4hFxy/
	iaSP+Ha1Y3l5wtO6REz/kWleYoofPW5jpnFLG76wN6A7aAiSqC+v58fdzAVR+orm9EB+CsnLzF+
	+rP8xz2lKC7lt7HPmP1jbzqLIWsgv/DDm/f819n2Rt17fxo+p1SujUxgjnZT5+S8BOgDcBviwEG
	HSJ85He1wgc3Bjvu8ZWF+milpOfkFHpLdaYczYAStYBR+ames7AtMNakGvtqIL/QHq6O5A=
X-Google-Smtp-Source: AGHT+IG9L5a0r/NdoAT1ohIBYjXSvm6NtF9CNaPrbz2JKpE2fMKa/uar54tyDQwfdBSdEpNrfQnRUbFFbJSiFt8W4EQ=
X-Received: by 2002:a05:6402:1452:b0:63b:f22d:9254 with SMTP id
 4fb4d7f45d1cf-64044399015mr2070280a12.23.1761738671158; Wed, 29 Oct 2025
 04:51:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026123923.1531727-1-caojunjie650@gmail.com>
 <20251026123923.1531727-3-caojunjie650@gmail.com> <aQDDjzl65dMZEnwM@aspen.lan>
In-Reply-To: <aQDDjzl65dMZEnwM@aspen.lan>
From: Junjie Cao <caojunjie650@gmail.com>
Date: Wed, 29 Oct 2025 19:49:35 +0800
X-Gm-Features: AWmQ_bkmVwrubVSK9QRHrpoai2PlgXID_3JWsZtl1cctLfRNPfV3c2wXTnhUYhg
Message-ID: <CAK6c68h3Mc0=JbbbVAmo_cYeOR_T-_rRy5EacgYQh7HgQZOPBg@mail.gmail.com>
Subject: Re: [PATCH 2/2] backlight: aw99706: Add support for Awinic AW99706 backlight
To: Daniel Thompson <danielt@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 9:21=E2=80=AFPM Daniel Thompson <danielt@kernel.org=
> wrote:
>
> On Sun, Oct 26, 2025 at 08:39:23PM +0800, Junjie Cao wrote:
> > Add support for Awinic AW99706 backlight, which can be found in
> > tablet and notebook backlight, one case is the Lenovo Legion Y700
> > Gen4. This driver refers to the official datasheets and android
> > driver, they can be found in [1].
> >
> > [1] https://www.awinic.com/en/productDetail/AW99706QNR
> >
> > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> > ---
> > diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backligh=
t/aw99706.c
> > new file mode 100644
> > index 000000000..8dafdea45
> > --- /dev/null
> > +++ b/drivers/video/backlight/aw99706.c
> > @@ -0,0 +1,503 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * aw99706 - Backlight driver for the AWINIC AW99706
> > + *
> > + * Copyright (C) 2025 Junjie Cao <caojunjie650@gmail.com>
> > + * Copyright (C) 2025 Pengyu Luo <mitltlatltl@gmail.com>
> > + *
> > + * Based on vendor driver:
> > + * Copyright (c) 2023 AWINIC Technology CO., LTD
> > + */
> > +
> > +#include <linux/backlight.h>
> > +#include <linux/bitfield.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio.h>
> > +#include <linux/i2c.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/regmap.h>
> > +
> > +#define AW99706_MAX_BRT_LVL          4095
> > +#define AW99706_REG_MAX                      0x1F
> > +#define AW99706_ID                   0x07
> > +
> > +/* registers list */
> > +#define AW99706_CFG0_REG                     0x00
> > +#define AW99706_DIM_MODE_MASK                        GENMASK(1, 0)
> > +
> > +#define AW99706_CFG1_REG                     0x01
> > +#define AW99706_SW_FREQ_MASK                 GENMASK(3, 0)
> > +#define AW99706_SW_ILMT_MASK                 GENMASK(5, 4)
> > +
> > +#define AW99706_CFG2_REG                     0x02
> > +#define AW99706_ILED_MAX_MASK                        GENMASK(6, 0)
> > +#define AW99706_UVLOSEL_MASK                 BIT(7)
> > +
> > +#define AW99706_CFG3_REG                     0x03
> > +#define AW99706_CFG4_REG                     0x04
> > +#define AW99706_BRT_MSB_MASK                 GENMASK(3, 0)
> > +
> > +#define AW99706_CFG5_REG                     0x05
> > +#define AW99706_BRT_LSB_MASK                 GENMASK(7, 0)
> > +
> > +#define AW99706_CFG6_REG                     0x06
> > +#define AW99706_FADE_TIME_MASK                       GENMASK(2, 0)
> > +#define AW99706_SLOPE_TIME_MASK                      GENMASK(5, 3)
> > +#define AW99706_RAMP_CTL_MASK                        GENMASK(7, 6)
> > +
> > +#define AW99706_CFG7_REG                     0x07
> > +#define AW99706_BRT_MODE_MASK                        GENMASK(1, 0)
> > +
> > +#define AW99706_CFG8_REG                     0x08
> > +#define AW99706_ONOFF_TIME_MASK                      GENMASK(2, 0)
> > +
> > +#define AW99706_CFG9_REG                     0x09
> > +#define AW99706_CFGA_REG                     0x0A
> > +#define AW99706_CFGB_REG                     0x0B
> > +#define AW99706_CFGC_REG                     0x0C
> > +#define AW99706_CFGD_REG                     0x0D
> > +#define AW99706_FLAG_REG                     0x10
> > +#define AW99706_BACKLIGHT_EN_MASK            BIT(7)
> > +
> > +#define AW99706_CHIPID_REG                   0x11
> > +#define AW99706_LED_OPEN_FLAG_REG            0x12
> > +#define AW99706_LED_SHORT_FLAG_REG           0x13
> > +#define AW99706_MTPLDOSEL_REG                        0x1E
> > +#define AW99706_MTPRUN_REG                   0x1F
> > +
> > +#define RESV 0
> > +
> > +/* Boost switching frequency table, in kHz */
> > +static const u32 aw99706_sw_freq_tbl[] =3D {
> > +     RESV, RESV, RESV, RESV, 300, 400, 500, 600,
> > +     660, 750, 850, 1000, 1200, 1330, 1500, 1700
> > +};
> > +
> > +/* Switching current limitation table, in mA */
> > +static const u32 aw99706_sw_ilmt_tbl[] =3D {
> > +     1500, 2000, 2500, 3000
> > +};
> > +
> > +/* ULVO threshold table, in mV */
> > +static const u32 aw99706_ulvo_thres_tbl[] =3D {
> > +     2200, 5000
> > +};
> > +
> > +/* Fade In/Out time table, in us */
> > +static const u32 aw99706_fade_time_tbl[] =3D {
> > +     8, 16, 32, 64, 128, 256, 512, 1024
> > +};
> > +
> > +/* Slope time table, in ms */
> > +static const u32 aw99706_slopetime_tbl[] =3D {
> > +     8, 24, 48, 96, 200, 300, 400, 500
> > +};
> > +
> > +/* Turn on/off time table, in ns */
> > +static const u32 aw99706_onoff_time_tbl[] =3D {
> > +     RESV, 250, 500, 1000, 2000, 4000, 8000, 16000
> > +};
> > +
> > +struct aw99706_device {
> > +     struct i2c_client *client;
> > +     struct device *dev;
> > +     struct regmap *regmap;
> > +     struct backlight_device *bl_dev;
> > +     struct gpio_desc *hwen_gpio;
> > +     bool bl_enable;
> > +};
> > +
> > +enum reg_access {
> > +     REG_NONE_ACCESS =3D 0,
> > +     REG_RD_ACCESS   =3D 1,
> > +     REG_WR_ACCESS   =3D 2,
> > +};
> > +
> > +struct aw99706_reg {
> > +     u8 defval;
> > +     u8 access;
> > +};
> > +
> > +const struct aw99706_reg aw99706_regs[AW99706_REG_MAX + 1] =3D {
> > +     [AW99706_CFG0_REG]              =3D {0x65, REG_RD_ACCESS | REG_WR=
_ACCESS},
> > +     [AW99706_CFG1_REG]              =3D {0x39, REG_RD_ACCESS | REG_WR=
_ACCESS},
> > +     [AW99706_CFG2_REG]              =3D {0x1e, REG_RD_ACCESS | REG_WR=
_ACCESS},
> > +     [AW99706_CFG3_REG]              =3D {0x04, REG_RD_ACCESS | REG_WR=
_ACCESS},
> > +     [AW99706_CFG4_REG]              =3D {0x00, REG_RD_ACCESS | REG_WR=
_ACCESS},
> > +     [AW99706_CFG5_REG]              =3D {0x00, REG_RD_ACCESS | REG_WR=
_ACCESS},
> > +     [AW99706_CFG6_REG]              =3D {0xa9, REG_RD_ACCESS | REG_WR=
_ACCESS},
> > +     [AW99706_CFG7_REG]              =3D {0x04, REG_RD_ACCESS | REG_WR=
_ACCESS},
> > +     [AW99706_CFG8_REG]              =3D {0x0c, REG_RD_ACCESS | REG_WR=
_ACCESS},
> > +     [AW99706_CFG9_REG]              =3D {0x4b, REG_RD_ACCESS | REG_WR=
_ACCESS},
> > +     [AW99706_CFGA_REG]              =3D {0x72, REG_RD_ACCESS | REG_WR=
_ACCESS},
> > +     [AW99706_CFGB_REG]              =3D {0x01, REG_RD_ACCESS | REG_WR=
_ACCESS},
> > +     [AW99706_CFGC_REG]              =3D {0x6c, REG_RD_ACCESS | REG_WR=
_ACCESS},
> > +     [AW99706_CFGD_REG]              =3D {0xfe, REG_RD_ACCESS | REG_WR=
_ACCESS},
> > +     [AW99706_FLAG_REG]              =3D {0x00, REG_RD_ACCESS},
> > +     [AW99706_CHIPID_REG]            =3D {AW99706_ID, REG_RD_ACCESS},
> > +     [AW99706_LED_OPEN_FLAG_REG]     =3D {0x00, REG_RD_ACCESS},
> > +     [AW99706_LED_SHORT_FLAG_REG]    =3D {0x00, REG_RD_ACCESS},
> > +
> > +     /*
> > +      * Write bit is dropped here, writing BIT(0) to MTPLDOSEL will un=
lock
> > +      * Multi-time Programmable (MTP).
> > +      */
> > +     [AW99706_MTPLDOSEL_REG]         =3D {0x00, REG_RD_ACCESS},
> > +     [AW99706_MTPRUN_REG]            =3D {0x00, REG_NONE_ACCESS},
> > +};
> > +
> > +static bool aw99706_readable_reg(struct device *dev, unsigned int reg)
> > +{
> > +     return aw99706_regs[reg].access & REG_RD_ACCESS;
> > +}
> > +
> > +static bool aw99706_writeable_reg(struct device *dev, unsigned int reg=
)
> > +{
> > +     return aw99706_regs[reg].access & REG_WR_ACCESS;
> > +}
> > +
> > +static inline int aw99706_i2c_read(struct aw99706_device *aw, u8 reg,
> > +                                unsigned int *val)
> > +{
> > +     return regmap_read(aw->regmap, reg, val);
> > +}
> > +
> > +static inline int aw99706_i2c_write(struct aw99706_device *aw, u8 reg,=
 u8 val)
> > +{
> > +     return regmap_write(aw->regmap, reg, val);
> > +}
> > +
> > +static inline int aw99706_i2c_update_bits(struct aw99706_device *aw, u=
8 reg,
> > +                                       u8 mask, u8 val)
> > +{
> > +     return regmap_update_bits(aw->regmap, reg, mask, val);
> > +}
> > +
> > +struct aw99706_dt_prop {
> > +     const char * const name;
> > +     const u32 * const lookup_tbl;
> > +     u8 tbl_size;
> > +     u8 reg;
> > +     u8 mask;
> > +     u8 val;
> > +     u32 raw_val;
> > +};
> > +
> > +static struct aw99706_dt_prop aw99706_dt_props[] =3D {
> > +     {
> > +             "awinic,dim-mode", NULL,
> > +             0,
> > +             AW99706_CFG0_REG, AW99706_DIM_MODE_MASK
> > +     },
> > +     {
> > +             "awinic,sw-freq", aw99706_sw_freq_tbl,
> > +             ARRAY_SIZE(aw99706_sw_freq_tbl),
> > +             AW99706_CFG1_REG, AW99706_SW_FREQ_MASK
> > +     },
> > +     {
> > +             "awinic,sw-ilmt", aw99706_sw_ilmt_tbl,
> > +             ARRAY_SIZE(aw99706_sw_ilmt_tbl),
> > +             AW99706_CFG1_REG, AW99706_SW_ILMT_MASK
> > +     },
> > +     {
> > +             "awinic,iled-max", NULL,
> > +             0,
> > +             AW99706_CFG2_REG, AW99706_ILED_MAX_MASK
> > +
> > +     },
> > +     {
> > +             "awinic,uvlo-thres", aw99706_ulvo_thres_tbl,
> > +             ARRAY_SIZE(aw99706_ulvo_thres_tbl),
> > +             AW99706_CFG2_REG, AW99706_UVLOSEL_MASK
> > +     },
> > +     {
> > +             "awinic,fade-time", aw99706_fade_time_tbl,
> > +             ARRAY_SIZE(aw99706_fade_time_tbl),
> > +             AW99706_CFG6_REG, AW99706_FADE_TIME_MASK
> > +     },
> > +     {
> > +             "awinic,slope-time", aw99706_slopetime_tbl,
> > +             ARRAY_SIZE(aw99706_slopetime_tbl),
> > +             AW99706_CFG6_REG, AW99706_SLOPE_TIME_MASK
> > +     },
> > +     {
> > +             "awinic,ramp-ctl", NULL,
> > +             0,
> > +             AW99706_CFG6_REG, AW99706_RAMP_CTL_MASK
> > +     },
> > +     {
> > +             "awinic,brt-mode", NULL,
> > +             0,
> > +             AW99706_CFG7_REG, AW99706_BRT_MODE_MASK
> > +     },
> > +     {
> > +             "awinic,onoff-time", aw99706_onoff_time_tbl,
> > +             ARRAY_SIZE(aw99706_onoff_time_tbl),
> > +             AW99706_CFG8_REG, AW99706_ONOFF_TIME_MASK
> > +     },
> > +};
> > +
> > +static int aw99706_lookup(const u32 * const tbl, int size, u32 val)
> > +{
> > +     int i;
> > +
> > +     for (i =3D 0; i < size; i++)
> > +             if (tbl[i] =3D=3D val)
> > +                     return i;
> > +
> > +     return -1;
> > +}
> > +
> > +static inline void aw99706_prop_set_default(struct aw99706_dt_prop *pr=
op)
> > +{
> > +     prop->val =3D prop->mask & aw99706_regs[prop->reg].defval;
>
> Why included the default value in the register descriptions?
>
> defval is only used to provide values for missing DT properties so using
> the raw register values is cryptic and hard to read.
>
> Including a default value in the aw99706_dt_props table instead would be
> much more readable (because the defaults could use the same units at the
> device tree).
>

Agree, I will include the default values in the aw99706_dt_props table.

>
> > +}
> > +
> > +static void aw99706_dt_property_convert(struct aw99706_dt_prop *prop)
> > +{
> > +     unsigned int val, shift;
> > +
> > +     if (prop->lookup_tbl) {
> > +             val =3D aw99706_lookup(prop->lookup_tbl, prop->tbl_size,
> > +                                  prop->raw_val);
> > +             if (val < 0) {
> > +                     aw99706_prop_set_default(prop);
>
> This should not happen silently.
>
> If the DT has provided an invalid value then we be issuing *at minimum*
> a message at warning level or above. Many drivers will simply refuse to
> probe when the DT is broken.
>

Indeed, I missed it.

>
> > +                     return;
> > +             }
> > +
> > +     } else {
> > +             val =3D prop->raw_val;
> > +     }
> > +
> > +     shift =3D ffs(prop->mask) - 1;
> > +     val <<=3D shift;
> > +     prop->val =3D prop->mask & val;
> > +}
> > +
> > +static void aw99706_dt_parse(struct aw99706_device *aw)
> > +{
> > +     struct aw99706_dt_prop *prop;
> > +     int ret, i;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(aw99706_dt_props); i++) {
> > +             prop =3D &aw99706_dt_props[i];
> > +             ret =3D device_property_read_u32(aw->dev, prop->name,
> > +                                            &prop->raw_val);
> > +             if (ret < 0) {
> > +                     dev_warn(aw->dev, "Missing property %s: %d\n",
> > +                              prop->name, ret);
>
> Why is there a warning when an optional property is not present. A DT
> not including an optional property needs no message at all.
>

They are mandatory in the downstream, and providing all properties is
difficult sometimes, so I set a default value if one is missing. But
one device may use a configuration different from the component
vendor's. These default values may be not optimal, so I issue a
warning for property missing. (I forgot to address it)

>
> > +
> > +                     aw99706_prop_set_default(prop);
> > +             } else {
> > +                     aw99706_dt_property_convert(prop);
> > +             }
> > +     }
> > +
> > +     /* This property requires a long linear array, using formula for =
now */
> > +     aw99706_dt_props[3].val =3D (aw99706_dt_props[3].raw_val - 5000) =
/ 500;
>
> Using a formula is fine, but I don't like doing it retrospectively.
> Hard coding the 3 makes maintenance difficult and we end up making the
> whole of aw99706_dt_props writeable just so we can store raw_val once!
>
> Much better, IMHO, to embed a function pointer into the table and make
> the whole table const. The function pointer can be
> aw99706_dt_property_convert() in most cases (although rename it
> `aw99706_dt_property_lookup_from_table() ) and can implement any
> formula you need.
>

Helpful opinion. I will do this in next version.

>
> > +}
> > +
> > +static int aw99706_hw_init(struct aw99706_device *aw)
> > +{
> > +     int ret, i;
> > +
> > +     gpiod_set_value_cansleep(aw->hwen_gpio, 1);
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(aw99706_dt_props); i++) {
> > +             ret =3D aw99706_i2c_update_bits(aw, aw99706_dt_props[i].r=
eg,
> > +                                           aw99706_dt_props[i].mask,
> > +                                           aw99706_dt_props[i].val);
> > +             if (ret < 0) {
> > +                     dev_err(aw->dev, "Failed to write init data %d\n"=
, ret);
> > +                     return ret;
> > +             }
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int aw99706_bl_enable(struct aw99706_device *aw, bool en)
> > +{
> > +     int ret;
> > +     u8 val;
> > +
> > +     FIELD_MODIFY(AW99706_BACKLIGHT_EN_MASK, &val, en);
> > +     ret =3D aw99706_i2c_update_bits(aw, AW99706_CFGD_REG,
> > +                                   AW99706_BACKLIGHT_EN_MASK, val);
> > +     if (ret)
> > +             dev_err(aw->dev, "Failed to enable backlight!\n");
> > +
> > +     return ret;
> > +}
> > +
> > +static int aw99706_backlight_switch(struct aw99706_device *aw, u32 brt=
_lvl)
> > +{
> > +     bool bl_enable_now =3D !!brt_lvl;
> > +     int ret =3D 0;
> > +
> > +     if (aw->bl_enable !=3D bl_enable_now) {
> > +             aw->bl_enable =3D bl_enable_now;
> > +             ret =3D aw99706_bl_enable(aw, bl_enable_now);
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static int aw99706_update_brightness(struct aw99706_device *aw, u32 br=
t_lvl)
> > +{
> > +     int ret;
> > +
> > +     ret =3D aw99706_i2c_write(aw, AW99706_CFG4_REG,
> > +                             (brt_lvl >> 8) & AW99706_BRT_MSB_MASK);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret =3D aw99706_i2c_write(aw, AW99706_CFG5_REG,
> > +                             brt_lvl & AW99706_BRT_LSB_MASK);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return aw99706_backlight_switch(aw, brt_lvl);
>
> I'm not sure there is much benefit pushing this out into a seperate
> function. Merge this inline.
>
> > +}
>

I see.

Regards,
Junjie

