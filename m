Return-Path: <linux-fbdev+bounces-7620-lists+linux-fbdev=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IxLwNXSlL2rPDwUAu9opvQ
	(envelope-from <linux-fbdev+bounces-7620-lists+linux-fbdev=lfdr.de@vger.kernel.org>)
	for <lists+linux-fbdev@lfdr.de>; Mon, 15 Jun 2026 09:10:44 +0200
X-Original-To: lists+linux-fbdev@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B06840D4
	for <lists+linux-fbdev@lfdr.de>; Mon, 15 Jun 2026 09:10:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=l4M5jO1D;
	spf=pass (mail.lfdr.de: domain of "linux-fbdev+bounces-7620-lists+linux-fbdev=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-fbdev+bounces-7620-lists+linux-fbdev=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B2FAC3009B05
	for <lists+linux-fbdev@lfdr.de>; Mon, 15 Jun 2026 07:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89013BB138;
	Mon, 15 Jun 2026 07:10:40 +0000 (UTC)
X-Original-To: linux-fbdev@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12861D8E01
	for <linux-fbdev@vger.kernel.org>; Mon, 15 Jun 2026 07:10:39 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781507440; cv=pass; b=lFbx1wV+bFx70az8ogIXfLIvSXHlMc3TEa3jSB4w2nSPE5D7twU+xgZdDKwNjYlBbOP+INUu/ZYRtTHDI+EVpumaPuiL4FaaF5Z6u9arZdHNzb4vYAhmSDujQ23IhAbe/97YzfJNgvshqNsKLzSb2fE03Gtos4Vt/A061z9PXWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781507440; c=relaxed/simple;
	bh=Ox3fjy9suyScmRrcmhaltE9MsZADpI1WVron/xvMJL0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYoZolMwUq9ICBb8F9v5enpZ98FsVVqFmUYaKushQs1joyYaYr8q1TbduClpKU57AEwwR7cf3Wlse5j1BeOTi3pvdmjWNBU8V2zL0EmUJwxJIunguuw1ISGXKfMCeHmMDTNhMgPriYu6ot7+PhuDFP4RewXUVSsV47fmg6YjnYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4M5jO1D; arc=pass smtp.client-ip=209.85.218.41
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-bed19623d6eso389826066b.1
        for <linux-fbdev@vger.kernel.org>; Mon, 15 Jun 2026 00:10:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781507438; cv=none;
        d=google.com; s=arc-20240605;
        b=F4lHpbc6rXqcmy5TQO6oBXaRNyEhPWF7bgb/xpNuVINFB2c2TqTNGi/w4kr+0bMJPe
         MMEgn8waLVrA1a68U9hqrDu19hfDM1aUhhDO3eD2u2PaCU+CLtJQ7NS3Fdx9yR0sA0Nu
         LqZxYgixW7Hq4pdTXhXIq7btC/GsNBXdpMZTxwA1qVdWoAaTo35U20CneGQ07XubaF+1
         rqnJ3yAHR+X/USc3Gdc1Gt7v0B5os4hHzVbW7DpGp7aA9WXsQdtmxCh6SP3eSu31v51C
         PtBHeUAJwUPp/KAWCjU6AbWBWI5qu19FsM7qp+pl3VQt6VCz27MZwQytNj50x2hmpL4N
         YaIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ox3fjy9suyScmRrcmhaltE9MsZADpI1WVron/xvMJL0=;
        fh=9ot+21+nVZvTF/99o4u9W1TxTvzjM5CePp2R/Okatug=;
        b=f+206hG6/r/3NCe8GYMie/gFRc4v9n/5J3TkL1Pb9qLgffrDihOR+fF2x8IcQ++zi2
         m8eBOnwkz6OUXV9n8i+913W+KnIZUiu/vPbUdnm2nM2lZ9ks6c7+agYEqMKRTrCWcEeH
         0IamkJYsmXwfJ9E/Rj6/ffEZESspTBFuZfC7+XRWVaAVe9e+JrKTn2fCwhebu980I9+P
         QIDomUA/eaxp9l1WFDkXNyP0kLTXgYYFmF17VzEzYDQSyHQZAfWWic45S3eBzpBmDTPb
         ulFe0OoBa6Ja9ojj/9DzDCh6fDg4j0vbeC2J0xzTBDo7lnyEjdt7Is22N9VdnSfnpB/9
         Uv+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507438; x=1782112238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ox3fjy9suyScmRrcmhaltE9MsZADpI1WVron/xvMJL0=;
        b=l4M5jO1DRmY5LKGtczrVeqh3rLrSNOtEXHhEoNow4yd2FI0Tioi8EUsFQxMDXR+Orx
         EPfWErOA1WpNdIPnkOSup/UEQMQ5jjzqod5VhdgVEbUbpur5GacevzyJKzSkgKx/LGxz
         koLgWnaZy7IFa15XehUQwxzO3tpxSGcy0ZGMG3UeJ1iXVFqnBG2gM5XJUmdGzQ4KuOR6
         Eb9cCuomeWMxa/Vacn6QCg9qlKpaqEjjY5BBhD2+eh7dN5Dg1jhR0ISDJbEvlO//76Uw
         ayBF7xkV/R/KrPc4E+F5ZFdkxn8irSPDy0JtIRs/cBtqwiSIkqe8NJIi9OL4eR+deE4N
         m6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507438; x=1782112238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ox3fjy9suyScmRrcmhaltE9MsZADpI1WVron/xvMJL0=;
        b=AeSbUsXQ3vuvMJjDpjIwt8RlGx3poPSTcpiFXeA5eoHGarnkA5KD2xuVowX61mdQsc
         o/3/fhLUqbTc4jDaS5FW5H7pDkkLeJGyk6A3wvZuy5SXEe7qTXJRZcwj5Z4ZS/+LOXnu
         9sLq+AdU+g8FfKX6NnFMrMqNPoJQZHerJ1x0RC4XL9QEee3cQwITBh0G+EVLO7cYkNmO
         zIvZHoGUVyiNcFgbU6BUPs04z/s65rWG2AyqiyhUhSUbw4sPzVqimEN7aCJcCM3Cm01m
         SelI6ZCfzIioNNSXDtJN2mshSM1fOqv6CwXL2+MrZOP6kWWD2pipEUvnWSmacl/Nmmme
         mCfw==
X-Forwarded-Encrypted: i=1; AFNElJ+gCb3fx55PEkDXfD3sw7Hhp+/1ugVoapuDDdvdH5qF7Si8Ca/tvybrp2kIkqwXDlt9He4a43Up5lfeyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYoSbUkgO+YpVm0vXlAnmdAqoFFJcG17o6+p/h85VKrhPZMMHy
	cVKPYq0VYjQQKSaQCn0paZWuf4VUrS6aqnFRq2/wspe2i5FYK3DsqqK9jkrkJKiQnGX0tGBUogY
	XP5G8TcO6Bswb6G7FaS27qVR0W62uqqk=
X-Gm-Gg: Acq92OG0jXwehidofdvn0ZJKqPZ23PV3rFX6YRQHTngQtZRKKRjtfjX3K3Zw80XRl7R
	JgjDqVQA9FQQErgoEw5HN31P6Tk+NNFj54fR9729t4z5pauCvIWnCyqqbPfbsAj2555IZFmNuOt
	z90AHxKNL/sR0nt8iwlDW42XCgJ7l4Lx9UkB13QSLxk23yULhiFLr7PzKJVghfw/qhvsnq7f8TB
	rqREUIBWjaAQ+yvzknurJ9decx/xAkZ65/a9jhVgbYcIuv6DS5OBf5SBLcz1N0YIBxlMM8vTz5Z
	xwWNIKao0+MlsSLsDfWtIHWbtCarFyLt/5xI5KBWQbMxMPHdTQWDCQp0m4wAf0G3wblvH10PmK8
	fCtf7zRadbgav7mJ+4R9HmGLZDP9cB2ayy8TXYDTFpfOMizuxMwWc1oMqg04DBqpVxAKf
X-Received: by 2002:a17:906:cc4e:b0:bd4:6da5:d5b2 with SMTP id
 a640c23a62f3a-bfe278302c0mr422985266b.1.1781507437663; Mon, 15 Jun 2026
 00:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-fbdev@vger.kernel.org
List-Id: <linux-fbdev.vger.kernel.org>
List-Subscribe: <mailto:linux-fbdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-fbdev+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614200837.17908-1-reeveskeefe@gmail.com>
In-Reply-To: <20260614200837.17908-1-reeveskeefe@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 15 Jun 2026 10:10:00 +0300
X-Gm-Features: AVVi8Ccqd-I4uOPWzClztukgUI3AAdEG0bLZD1O4-8fQaU-229tIeoSg2FTznI8
Message-ID: <CAHp75VfSUfjo6rxUdwMghZb7V9s2_AgYCDex5uDX3cCWZOenyg@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: use %pe for backlight errors
To: Keefe Reeves <reeveskeefe@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, abdun.nihaal@gmail.com, 
	error27@gmail.com, chintanlike@gmail.com, namcao@linutronix.de, 
	niejianglei2021@163.com, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, 
	Keefe Reeves <229415268+reeveskeefe@users.noreply.github.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:reeveskeefe@gmail.com,m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:abdun.nihaal@gmail.com,m:error27@gmail.com,m:chintanlike@gmail.com,m:namcao@linutronix.de,m:niejianglei2021@163.com,m:dri-devel@lists.freedesktop.org,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:229415268+reeveskeefe@users.noreply.github.com,m:abdunnihaal@gmail.com,m:229415268@users.noreply.github.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[andyshevchenko@gmail.com,linux-fbdev@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-7620-lists,linux-fbdev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshevchenko@gmail.com,linux-fbdev@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,gmail.com,linutronix.de,163.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,users.noreply.github.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-fbdev,reeveskeefe];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 785B06840D4

On Sun, Jun 14, 2026 at 11:08=E2=80=AFPM Keefe Reeves <reeveskeefe@gmail.co=
m> wrote:
>
> From: Keefe Reeves <229415268+reeveskeefe@users.noreply.github.com>
>
> Coccinelle found two places where backlight registration errors are
> printed by passing PTR_ERR() to dev_err().
>
> Use %pe instead so the error pointer can be printed directly. This keeps
> the behavior the same and just makes the error printing cleaner.
>
> Signed-off-by: Keefe Reeves <229415268+reeveskeefe@users.noreply.github.c=
om>

I see a subtle problem with this email address. In case something
happened with your contribution (exempli gratia a regression found)
there will be no possibility to contact you without digging into
mailing list archives to get your Gmail address. I would prefer to see
the From: and SoB to acce-pt responses.

For the change itself, I have no objections. If one considers this
useful (probably to stop flood of the similar patches in the future)
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

