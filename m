Return-Path: <linux-fbdev+bounces-7978-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id n+92KQNBVmoN2QAAu9opvQ
	(envelope-from <linux-fbdev+bounces-7978-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Tue, 14 Jul 2026 16:00:35 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B62875570C
	for <lists+linux-fbdev@lfdr.de>; Tue, 14 Jul 2026 16:00:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Ibm/XjI/";
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7978-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7978-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0609C3015855
	for <lists+linux-fbdev@lfdr.de>; Tue, 14 Jul 2026 14:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7AC436C0AC;
	Tue, 14 Jul 2026 14:00:28 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BADE370AEE
	for <linux-fbdev@vger.kernel.org>; Tue, 14 Jul 2026 14:00:27 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784037628; cv=pass; b=In2reHjAAXF4ccaG5XeLinAunyQ/AABX4MPdG4wEyDQlEhIJtsZAZ3X6xhIoEwliEXdgc0SqdEjfQAgIAT78qC97Csz4G2VcdSB0c0Yjbt8KPJ6moNnyyjzJwY/M5RWBjmMp2n98BH7VQ+X1EL8PgrVh8WUc2J4bPIKJm+KP0Q0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784037628; c=relaxed/simple;
	bh=T9DIDFm3lzuegkQEDN325v2/6T2Fm7otzgZ6GevR3nE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtRn7vadtjs9ql4oG5c8VbsL6uM4nlzyaJhnm4x3pcfMeIBoGX1MsfJLjUHmSt/xuGrE8JdYv33PiPvV8e1Oiiuj/RYI5BG90ew92JyXAylhPDGTjc/b56btkvpZvP0kNPPkgH2m25QVsKW6kV9ocqzGacS7rq/yNGurwXY3QYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ibm/XjI/; arc=pass smtp.client-ip=209.85.215.180
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so2788403a12.2
        for <linux-fbdev@vger.kernel.org>; Tue, 14 Jul 2026 07:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784037627; cv=none;
        d=google.com; s=arc-20260327;
        b=cH1jMfbcz/jlh0dHaEAFIF59Yc1cTx8HCxCubI8gDlR9jl5QrYv5NmuHcZN2/K7i+V
         g0zhZnFXSXoBHd4YgS/oZ0knKoRptk0tk1hfjxcSUBeAEa/GjbeJhiZ/pjcTbB5djw5o
         9vvXe6wG6pj89/Rq5ziP8KLRTLN1GG9jNdiPWiiQER0fhp1m2EVJ94+VsqtiPqyApr0S
         UT5NicIvLF6iMRd6/SVOivJI1XK/Mtwuc7fWjfdRk4Y62tELMve4QXbJX121JD4N3WI/
         44oJW9by8EpBi6LjyuQc1m+rGEtRBvE7JqR4kRlD9TVITiTDE/fKetMRt71NvQ/BisEw
         gJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V2/KhXQ427CL5ieErbt2/8G6KNeA30GSlOdbiwIQ4Jc=;
        fh=jRDv/PQh2jisH5Oph7P915pImuEjqdIMnlYM/6rlQy4=;
        b=prIpmqQfC1Rs3LpMAdk6sJ1V45NfCC2W5x64WJaV+/xs06YGx36vgtMyudn9vjICc4
         1qWLlX+aT3N+Y+tHN8wsVl1OW6XbmDJeGqohU9sKEWWeA/JeS5GJKIR7JQ63dHwQTJH0
         tR/9QE7CkzJdLCVNxi6+vT9F91O5xKJVeNNJh8p6Fy5WjxMYylQw+7nCK9J1mQ0Z2c2Z
         sCG5P159gIXIzpRo/5OdW6sJetH19ZQZwSkZpmQp081mIOAQcmX9Q8UFFYUKHXfkJZHR
         60/tfROy99O4Kdpi9iAxmlk8v7iJWOatj9qhws/jVR5t4/bTi/r2k5HyzQ4Fhj7J6FCn
         Pn8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784037627; x=1784642427; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V2/KhXQ427CL5ieErbt2/8G6KNeA30GSlOdbiwIQ4Jc=;
        b=Ibm/XjI/UF9zGxfKyTvCLeNx0Z8KAuQRc5hxmnVoiqbgj12rW/N74Zc8//Z70MGCYc
         s32dsQpdaYE6UgSdO1VLG4Ly05kYJPcrDNYGj7H0P6SXqbUkg6sasau7TJeuMu0CYJA/
         4GWc8UxZ+z5hm4E2ur0j7iJJvdxU+jbFXCsSVWOZViELOWaKQJE4JNeBKY8+nsEZjy2N
         oodjSRD4rTxP73j2T3GmMEkb/VBD3+N2SS/28TfjxTnXDXjnskUXTiuYm6T0bw0Hk8Uv
         J0S1TuF/6wjGTXuN7UNconlyJMW6bodw0ltWL5uo8UmTxedVStJ5ErsdcCcRO21KOsY4
         klEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784037627; x=1784642427;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2/KhXQ427CL5ieErbt2/8G6KNeA30GSlOdbiwIQ4Jc=;
        b=ntHbre0zkWDCR+x2AkRrYbDMu8mgEO+gjU3oZKdeZ8+aWNKmTSBBia+XrLoJr0CcN6
         nx85+M3jwAhA5cyTkHbt00nY/kRwSoAeL7KUKJ+WG1MMO1Wi5NgOPBBe+5OJbaoLUudw
         3FIrpr+YufPqbc1lOK4Qhvq+hHfwXqIx/D5Ai2qDDh9gi+j/gr4358GKY/glF+ouns4n
         Wz15Nzfp4GfyYgUnuEs0Xct5UNbFXATKCT/YBAE6z4IfWv6teVGlwtV8GijRiy0i/xKC
         zGGGlO8nvt0vTPiqEi2mgHQIxr9MfxlQTbiPuVk1LDVzmNMO677rIe0nxv39KVXMBSb0
         RYoA==
X-Forwarded-Encrypted: i=1; AHgh+Rq63SEwzB1nKQ2rQZBhbPpW8TtnkvtamhlejJxk7XR8PISK5/kjt4esGREbbVozIUzulYmftVgAvLtXaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7KvPwB/9UQhsuJHcevvXCfwUTlm9cBzFxLPTYJu2jvIMMOS42
	jV5JPLu0zAVaE+ZHeanbeYAbVJTfca2FhUlWiPEu+g0Eiw5Vx4SftdiKNR6z/NYxN5kK5bncX3l
	k49BIpGwzbJUfwdHul58iwaAfZry9Pm0=
X-Gm-Gg: AfdE7cnTBdlYlZ/yq5gasOwF8dtKTPLXDgUmoq4l30oEqDdwkbeVMEkyzKHJHHJZ3Wx
	GretDxTptZ503p9sBHY3V1u5bKra1taVCz+8QcbuWHkfW6+LNCjlKNGdUUwNP+6zK1ZXB3xVUjY
	9od1k/CTHIfOg6Gfx3auIAG93TPJIDWDhyKxqHaQItFMBYvW6OEryGIq3BOsYZ9v1SGF7LeQ22D
	3IEt1Q/GqJ98qoecyRwQRPBciFXmGpREz8FPWeGNv/nF7HiEZ7yVvV/JkkkWHd8aJ9hEeqNucU7
	LQibcnOKYWx89R2XL+BTNDTGwSEQk1oA3RuZz5Rh
X-Received: by 2002:a05:6a20:72a8:b0:3c0:9c18:d5ad with SMTP id
 adf61e73a8af0-3c3572b5794mr2798444637.74.1784037626720; Tue, 14 Jul 2026
 07:00:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260617080031.99156-1-clamor95@gmail.com> <20260617080031.99156-10-clamor95@gmail.com>
 <akeYWRF-wIlrHTF5@hovoldconsulting.com>
In-Reply-To: <akeYWRF-wIlrHTF5@hovoldconsulting.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 14 Jul 2026 17:00:15 +0300
X-Gm-Features: AUfX_mwnssZkuxVf2843X6HTYGv-SRm_VXHXZEuLPu7vTjXTmj8SvtNozHDr9W4
Message-ID: <CAPVz0n2EGy3uWwUfumvRxr2M_Z9ZMZ5f9=RO=S5vUsGk=ejcJQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] mfd: lm3533: Add support for VIN power supply
To: Johan Hovold <johan@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[clamor95@gmail.com,linux-fbdev@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-7978-lists,linux-fbdev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,dt];
	RSPAMD_EMAILBL_FAIL(0.00)[johan.kernel.org:query timed out,linux-fbdev@vger.kernel.org:query timed out,clamor95@gmail.com:query timed out];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B62875570C

=D0=BF=D1=82, 3 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 14:09 Johan=
 Hovold <johan@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Jun 17, 2026 at 11:00:26AM +0300, Svyatoslav Ryhel wrote:
> > Add support for 2.7V-5.5V VIN power supply.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> > -static void lm3533_enable(struct lm3533 *lm3533)
> > +static int lm3533_enable(struct lm3533 *lm3533)
> >  {
> > +     int ret;
> > +
> > +     ret =3D regulator_enable(lm3533->vin_supply);
> > +     if (ret) {
> > +             dev_err(lm3533->dev, "failed to enable vin power supply\n=
");
> > +             return ret;
> > +     }
> > +
>
> No delay needed?
>

I have not found any in the datasheet, if you are aware of the delay
duration needed please elaborate.

> >       gpiod_set_value(lm3533->hwen, 1);
> > +
> > +     return 0;
> >  }
>
> Johan

