Return-Path: <linux-fbdev+bounces-7584-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dsflCpx4KWqIXQMAu9opvQ
	(envelope-from <linux-fbdev+bounces-7584-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Jun 2026 16:45:48 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AADB66A5D0
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Jun 2026 16:45:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="PS+V+z/l";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7584-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7584-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 28BB63003BEE
	for <lists+linux-fbdev@lfdr.de>; Wed, 10 Jun 2026 14:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F3B9408637;
	Wed, 10 Jun 2026 14:45:42 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFA9411678
	for <linux-fbdev@vger.kernel.org>; Wed, 10 Jun 2026 14:45:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781102741; cv=pass; b=sWgyS96MDjzs8a0Ihv5U1Pc3uzN0jLry1iyWLaAD0KSTr5Qj2krvpnDCw5DI60INmOkayd6ZopJXf6DWr+oGU6zYbyI4cqZdwt7DkN9iZ1lHINWjRurSreqWCUn5kFl+otYOX8Tz2RJdxR31ldaclBuUG8X7e7c1j5u3zfnEv6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781102741; c=relaxed/simple;
	bh=GswxPypzPfEQ3WUnspGh8ax+2FMG/mXlBTk2AXjL34M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qEsWt60mLMTIGWaoDELM4YXLrMYS03FRq0TZBT7cbHFvTO/I5AFKUKSpjoTqdorjhWY5gQS0jM+NaWMjIua6qSygaPUDhujNNUEWkNWqXF29zZp87mefr0kYGyaqXyfPExljtB+Q5tpuCk4u/M3Ns/ebDjR5vSUTxzsCskX7wLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PS+V+z/l; arc=pass smtp.client-ip=74.125.82.177
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3075ce9c05aso919280eec.1
        for <linux-fbdev@vger.kernel.org>; Wed, 10 Jun 2026 07:45:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781102740; cv=none;
        d=google.com; s=arc-20240605;
        b=El/L2CocKnT5MLksR0d3H2uin9FGfNptcgUJ2ywVAnTsenCckFdymS5cGiMXk36GNv
         JXGXnwCBp0ydUa/Qiy/o7qz0CXdOnTSxEZLG1X7iGcIC2Gm2n6a9cZ78FJbv4ShfdkgP
         tCzwOU9cRulGqL9KCaB1iym93mP+2jnBnRWW3NbPhRYdB+xboMftpJt8X7+hSuo1n/gO
         0Nar1j4K5JVN3dyocWBWRtvLKxYU8u7qRY6Xm00pvVs+gbTgW/5D10NPFvv4II2RvWsw
         Ob/p4bvgZyQEkRykZKA+1KnguKrwHLg0nEPwdhkHlgFxXh+W3bGEJ5JXdyj/z/asMu9D
         K7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c9jdnGhl8zT/c5+VTx28YYMOorOCQjdA4WuOVZ2PMo0=;
        fh=kt2uv4LZW6Tk1d439367VlYSjAmu1IAoGbx1iqEQVmo=;
        b=AAuShLkvSWNpGs3/3dTHiD7gyHo3cwObK9JPL71nEPzzL/nkHAhmnoGNTGtFEqw0VQ
         WisSKSMV/C8oRUaMegkY5DNkb1vJlbMoSJO65UomxBXxjMxpVC04mdRg5KOUfVi4YPg8
         iKHE3sSG3ykTiIzmg+oZQgxNfjGzpgvw9vJc/MwVkkVnPcxf/1OgiJb5wgMzn354u8x7
         4hVaaxVB5hBg3a8Pyhjvx7lY1BLYvk1exCOmO+9kTnNzFd9wdRFbZVfXK3tZR/QDDFVR
         R8DVFM7HAi6ryayBmxeE/Cum5+AVKIQuBkpn7l452m1hFv/XxO6PCljFaVtNPTh1TW+y
         gPHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781102740; x=1781707540; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9jdnGhl8zT/c5+VTx28YYMOorOCQjdA4WuOVZ2PMo0=;
        b=PS+V+z/lvGHsNMiNLqAsuwXOJkGXmiJ7LdnOhP8LK5ZZ9ZfeboGuHxsVDIoBJsGeST
         qNCto5PN+wb7quOFQQdpV0kU4Hu+YaoYXZVqPMUurk6HluuoWyOPymeXxzolPkocYUDi
         EwsWfEFqo2XSpWWX6Cu3HFv3RqI2SdG0afwCDT3XMDVcNs6XGHQMbZZmqaCDuX5eWFrL
         N8ewC4XeYxBO9tSOG2FAnC2X43MxtriY0lh9PedRNcZ0ghV2JV4L2BiKDAq4fkJLKD57
         ghmcWTg4mfbxLje27RUG6Uu4P33Mr8oUt0b858zMNFeohBFYIPUxGY55huG86dzO6Thl
         ZSRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781102740; x=1781707540;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c9jdnGhl8zT/c5+VTx28YYMOorOCQjdA4WuOVZ2PMo0=;
        b=NHx7v1ooqWvC/y66Ij9s1ufWHeKsPE0Mia9YFKDZAlYD7tEs5zYlsBsyajN7N2f+Jv
         JY0yZFNN5kZXN0BnQtLFTyT/GAIAoBQJWWPsi6Gg/ocSwGGmGqektHHdBgq4MFHmsrcn
         G92XXfwW34Anxh6wyB6eFAEOc0UXfuXPySOSJogJazpBDoKRa5L2vNyraA9NkCJdJisB
         N4c6Xq1N20IW5ivhKm8npJMXerXsWmGYSrEnj67ywx5ezexDYG15i8QUiZU3oTV7JhED
         yAdC8n58c4sxr1n5hTGbtGuqLFTJWxVNEqHzQbLo9Y4Q7DrF7vxershnv4x/tYPpq8XQ
         Bxsw==
X-Forwarded-Encrypted: i=1; AFNElJ/5wN8Irnn13DZUAvCVqBbTCj+pNqm7C97xsNKPv7bTuSg+QPPb7cxO2nQXn0RjOwuPTYHCiYQ5dwL2xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxYihK/7cBjpCPfdJ5JjOkuZ9xYjUY9Whv7qeSEsSMPJDS7nwU
	y9+y5PuycY8sT8lGJhMABGICd10F/4GTmR+Hhx6oTvo3fSW1e55zNue+U5PIAATnRrzlY6gvTVA
	TLvfSPAuinbAP8qBheQZJ210Tl+8Nw/g=
X-Gm-Gg: Acq92OELXQTHombm9zJuJWNakkjMF6di4yl3yst4yCtGKd4+jJOexDkSE9003WK4mCC
	Q2o18MOSsljAQNBNkI0F+rl5FGZDj5I6Nh5phIleKUvyqxNMKBUTyReGFNG3vMNirv5ckDnSeW3
	NxYyUGsTCpU1jbBXXdrjAt4wHVF8d7Lo0vdnH+2DPLbRGJK6N+97tSw9j1uyEvV47AQa1XO53mh
	vnhuLPDWaY8pa9DEkOiPVL5RrTrP1yoikG+SdLVCadZEkrDKGDCx0Qd7pIF4PjPNLnmTiHhH1R8
	FkDPj7epDui9CdIe05w=
X-Received: by 2002:a05:7300:4307:b0:2ce:3aa1:d39b with SMTP id
 5a478bee46e88-3077b1e1921mr16407205eec.20.1781102739833; Wed, 10 Jun 2026
 07:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260606045738.21050-1-clamor95@gmail.com> <20260606045738.21050-15-clamor95@gmail.com>
 <aihoH9Pmzufa9pnE@ashevche-desk.local>
In-Reply-To: <aihoH9Pmzufa9pnE@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 10 Jun 2026 17:45:28 +0300
X-Gm-Features: AVVi8CdnB8ApS2xg5kxxnd98RqCsR1fmVPgPcGfJlrd3mQBMI1CAmZLqR9DFIrc
Message-ID: <CAPVz0n0m+i7wexfC0BWwvdOuJxDk_=x+EpxEbNmoHN1AsEmfNg@mail.gmail.com>
Subject: Re: [PATCH v4 14/14] video: leds: backlight: lm3533: Support getting
 LED sources from DT
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-7584-lists,linux-fbdev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-fbdev@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,mail.gmail.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1AADB66A5D0

=D0=B2=D1=82, 9 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 22:23=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sat, Jun 06, 2026 at 07:57:38AM +0300, Svyatoslav Ryhel wrote:
> > Add Control Bank to HVLED/LVLED muxing support based on the led-sources
> > defined in the device tree.
>
> ...
>
> >  static int lm3533_led_setup(struct lm3533_led *led)
> >  {
> > -     int ret;
> > +     u32 output_cfg_shift =3D 0;
>
> No need to assign the default to this.
>

This is a personal preference, compiler will optimize it if this is not nee=
ded.

> > +     u32 output_cfg_val =3D 0;
> > +     u32 output_cfg_mask =3D 0;
> > +     int ret, i;
>
> No need to add 'i'.
>

This is personal preference as well. There is no strict rule that
iteration variable must be defined strictly in the for loop.

> > +     if (led->num_leds) {
> > +             for (i =3D 0; i < led->num_leds; i++) {
>
>                 for (unsigned int i =3D 0; i < led->num_leds; i++) {
>
> > +                     if (led->leds[i] >=3D LM3533_LVCTRLBANK_MAX)
> > +                             continue;
> > +
> > +                     output_cfg_shift =3D led->leds[i] * 2;
> > +                     output_cfg_val |=3D led->id << output_cfg_shift;
> > +                     output_cfg_mask |=3D OUTPUT_LVLED_MASK << output_=
cfg_shift;
> > +             }
> > +
> > +             /* LVLED1, LVLED2 and LVLED3 */
> > +             ret =3D regmap_update_bits(led->regmap, LM3533_REG_OUTPUT=
_CONF1,
> > +                                      output_cfg_mask << OUTPUT_CONF1_=
SHIFT,
> > +                                      output_cfg_val << OUTPUT_CONF1_S=
HIFT);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             /* LVLED4 and LVLED5 */
> > +             ret =3D regmap_update_bits(led->regmap, LM3533_REG_OUTPUT=
_CONF2,
> > +                                      output_cfg_mask >> OUTPUT_CONF2_=
SHIFT,
> > +                                      output_cfg_val >> OUTPUT_CONF2_S=
HIFT);
> > +             if (ret)
> > +                     return ret;
> > +     }
>
> ...
>
> > +     if (led->num_leds > 0) {
> > +             ret =3D device_property_read_u32_array(&pdev->dev, "led-s=
ources",
> > +                                                  led->leds, led->num_=
leds);
> > +             if (ret) {
> > +                     dev_err(&pdev->dev, "failed to get led-sources\n"=
);
> > +                     goto err_deregister;
> > +             }
> > +     }
>
> This and other pieces may benefit from local variable
>
>         struct device *dev =3D &pdev->dev;
>
> defined at the top of the function.
>

Yes, but this would require an additional patch, which I will not add
to this already overinflated series.

> ...
>
> >  static int lm3533_bl_setup(struct lm3533_bl *bl)
>
> As per above.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

