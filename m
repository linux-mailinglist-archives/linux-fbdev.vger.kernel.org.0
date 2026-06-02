Return-Path: <linux-fbdev+bounces-7487-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AT9YLd7GHmr9UwAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7487-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 02 Jun 2026 14:04:46 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F15E62DCF3
	for <lists+linux-fbdev@lfdr.de>; Tue, 02 Jun 2026 14:04:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=D+i0zebN;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7487-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7487-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED8FC302DF4F
	for <lists+linux-fbdev@lfdr.de>; Tue,  2 Jun 2026 11:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 030E93C9ECF;
	Tue,  2 Jun 2026 11:59:20 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9996378D74
	for <linux-fbdev@vger.kernel.org>; Tue,  2 Jun 2026 11:59:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401559; cv=pass; b=DXuLtaoZ168vB4epQBadf7RJMzzVBCqrhMUAB1c1B2pF+6fbzwg9ACzvJUCfk353cTq9wL1XgmeyEi79bARptUJkpdxzHwRn28T+YeC82EWZj6/pXmCxruy++aaBdkCLhBJ2Vzd/+3PIcBGbsuy9B+f9CMmYaUW2Xryk/0l4DzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401559; c=relaxed/simple;
	bh=Ylt5hXVNR3LTkhF9xMnTUwL+GT8ti/XzIGNIjpX5U+E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHLUby19gr3WfHyl9kuGZRyW8SM9LiTTULR6VxFdoUq+A4q72h9C8lzjnvdxw53tQabKSo3ZA7p/Vtp87MQ1WHuzO3ZS7AjzX4v+zq6bhMZyYQ5tJLNBuv8lFc1ddIx99yr52IXwwL5f+GBNfsNa+Reba2GfhPkjfu0wBesJSjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+i0zebN; arc=pass smtp.client-ip=74.125.82.177
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304ddfcf72cso5242235eec.0
        for <linux-fbdev@vger.kernel.org>; Tue, 02 Jun 2026 04:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780401558; cv=none;
        d=google.com; s=arc-20240605;
        b=V6AMJGDJX1u53tWV/E4+iMSelWjpQTfiQXKQr654e7xbd51zPmVtul2LN2cmaI9Qbh
         XAQFX6DV691k/UR9wcBXUNKzFqNFUuKWDdAaPqFO4Lx3NDirXTSUyxR01l/Y89A2gzpN
         MjWS+kLIUtowXgtMtAknj4TRmc/KzH2ZTYyvrzziOXq/vzVAVgsu9OkxuZIaxKFOU6ga
         180djbtizoTQov6aszNvkGk/LpVJEch6jTPu4r4BBvOgopzWzSRExgttTqznOpnLBbnC
         QBiZN2EWuIekZUarqJfD5nGMqZOpn9CXRBTEwroz0M5OcX8pll1mLxcf+GwHv2l6FsjU
         ychA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QwoGUg+AbKtXga7fuYSOtkP7mpOfS4rBc+JAo9UwGTw=;
        fh=VpowYEIMShl2I4kgMszWFOjddxoLQsqAEr83cF7lmjM=;
        b=II7gM6H4awWr3x0AInafQPaGqhjgv1jTuAZnS5+nv+bfYti+ojwZHwTau/9EGbZ+Ho
         m1djfu0UVgr58tFoEsE3mOIG+/gS1p7yPgQpqZbjybE3qXIe+eXwGo2XXWAfHO0nQcPZ
         cW5NEOjBJsXayNL+jNB8Hb1gdy/ek9Lk+moE1NGW0gcLEORAmJ69/TSBiMXYxBA/q1aL
         Mhm97TQPKWHzaIh1v/RHdwhRDEF5Fvm+bWtq15bz5yJV7JdI5IKXgpnD4Cikp8OAWKaI
         D14R/BxkJeR7yhMB9+Qx4IWIf/zbdA4/07/ARrDgsqg8xv0zKvbYKtFE/jOChWcXZAX8
         3c+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780401558; x=1781006358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwoGUg+AbKtXga7fuYSOtkP7mpOfS4rBc+JAo9UwGTw=;
        b=D+i0zebNudh0YjRVZbcwm2tiAX6+eLuVdjhng/hb2GBzm1G7Ny7UVck00J6L5iEqJF
         sRh26UJBKc2ea5QyZbGvw95QLpRT/yxnGqh0Cu0tSZxDcSpj/zTfI6KYRPMt8weZNIWz
         nJEYhhKbokyH5ooAzPhIaTqCRIVi4gqM7l4CFeA4jXoC7kUiasZ5guEpLD5+dbnL8LbS
         bzhuhyLkHAWsDruWQSg4K8D4OQ2gWhOr0MRgl5dtZdjQUcPImVPJd6WuWzRJHtSqyxF5
         YBygyqeZU99cYMYWm+9lwA9BrUe6kgYpQ3IR2McwgllSud3fyVl4b5cCVJv55MqLeNb2
         QOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780401558; x=1781006358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QwoGUg+AbKtXga7fuYSOtkP7mpOfS4rBc+JAo9UwGTw=;
        b=GXNT2R2nPgpEofhuPYIrVd1TJrVwdJ5MmLX5CHpkf8WokR+0U7hwZB2x/ub2mJ2zN3
         7JxVSFOJ8e4OA2BvVwMIsN+n9BSioEwkOUXsFPSbIZJOlGWpp/k3MzVztgZ805HM3bC2
         /ow/HNayuVJRtVEsAlHhS1PrxEZzitAjXCFMu0y1hFajwXIwW/WdghlzQ0TsnesC64Ir
         0strvMD6Gn58pas0jpSddRghMRyb4JEPNjbdxDDTbt2ld6hGe8BAuFi+DwmXKzFKyX6L
         wNH/kyWSHpTwaKQqJAQTTNVdlF5ZytwYQUY1gsfXiWKnXMXeNeDNGW6yk21t1fs2PJBi
         L/JA==
X-Forwarded-Encrypted: i=1; AFNElJ//CvSGMf/KdRnYWD92AxiTH7oYG0Av7oL8Vjewuw6UyG8f7VvZTHsCYhY6DH1Pb+uzM48D0CIu07qy+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0cQeDST1JDv3stZ5DUywO9NWbFppT4RW0eeysYPCV+RjbgPem
	Cf82Oesrm8PW7/UArGJIR1AM2AaCskMPazQKQojhNl9Wlxh2N67QiJWkJJQ2oOyU1qZ98g0JK0b
	chY4/c9P9rAbZmspFz1Dp9gh+keTQmcU=
X-Gm-Gg: Acq92OH5x1FYvngSLGoz435ub0/7hWdvsjWOr3BFw4mGYIh36DGtDpIid0PFEHqfyOf
	Uho9fzoahivrWhqAgYzHg30w4kRuKFzxYqTqgU7NQA36jTAnKWQLEf3DCbqXejAFGC0xWonMrRe
	gUEE9MpMe1hwjMqI1b3eoGTykwz5CcqTe8gmm9c007aRDHcrI8xt8w5KzkjeI85g3MGGMLbqobv
	oN2L9n+KOsqFslSjALtWiNQ35r7y52LgOo/dc0SQu82tokORCtaOoJh6UeM87CVlGTCOZz43Pw0
	82QKUiPLOT8gbSx7WAE=
X-Received: by 2002:a05:7300:e58b:b0:2ea:edc0:4fbe with SMTP id
 5a478bee46e88-304fa5230d9mr7590808eec.14.1780401557759; Tue, 02 Jun 2026
 04:59:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260601151831.76350-1-clamor95@gmail.com> <20260601151831.76350-9-clamor95@gmail.com>
 <ah6PxFtoJUWkd79P@ashevche-desk.local> <CAPVz0n0P7Jk17cM2M1zuHZfySo2=Uibr5izwKU2tqiBpBcg0FQ@mail.gmail.com>
 <ah65hfgoM67V6-iR@ashevche-desk.local>
In-Reply-To: <ah65hfgoM67V6-iR@ashevche-desk.local>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 2 Jun 2026 14:59:06 +0300
X-Gm-Features: AVHnY4K2SWFA6Gct86VkeqymRy-YvpCnhDFWoUYjixtaQro8Ol55fBi-H9259ik
Message-ID: <CAPVz0n2V_a8Qf-yzsOipDRDtpH6h3ECJAXTYuavvMdj5-Fk=aw@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] video: backlight: lm3533_bl: Improve linear
 sysfs logic
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7487-lists,linux-fbdev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@intel.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-fbdev@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid,intel.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0F15E62DCF3

=D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 14:07=
 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Jun 02, 2026 at 01:19:00PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 2 =D1=87=D0=B5=D1=80=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 1=
1:09 Andy Shevchenko <andriy.shevchenko@intel.com> =D0=BF=D0=B8=D1=88=D0=B5=
:
> > > On Mon, Jun 01, 2026 at 06:18:28PM +0300, Svyatoslav Ryhel wrote:
>
> ...
>
> > > >       if (kstrtoul(buf, 0, &linear))
> > > >               return -EINVAL;
> > >
> > > Besides _assign_bits() in the below, side note here to unshadow error=
 codes:
> > >
> > >         ret =3D kstrtoul(buf, 0, &linear);
> > >         if (ret)
> > >                 return ret;
> > >
> > > (obviously in a separate change).
> >
> > Won't happen in this patches.
>
> You mean both suggestions or you are talking about kstrotoul() only? If i=
t's
> only about the latter, it's fine with me, but _assign_bits() makes sense =
to do
> in this patch as you already change the parameters enough to make it bett=
er.
>

only kstrotoul()

> ...
>
> > > >       ret =3D regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTR=
LBANK_AB_BCONF,
> > > > -                              mask, val);
> > > > +                              CTRLBANK_AB_BCONF_MODE(id),
> > > > +                              linear ? CTRLBANK_AB_BCONF_MODE(id) =
: 0);
> > > >       if (ret)
> > > >               return ret;
>
> ^^^ left for the context.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

