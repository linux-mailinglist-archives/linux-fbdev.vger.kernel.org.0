Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6386949213E
	for <lists+linux-fbdev@lfdr.de>; Tue, 18 Jan 2022 09:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234753AbiARIdf (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 18 Jan 2022 03:33:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232184AbiARIdf (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 18 Jan 2022 03:33:35 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02D69C061574;
        Tue, 18 Jan 2022 00:33:34 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id e3so64838697lfc.9;
        Tue, 18 Jan 2022 00:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version;
        bh=KLD+MloItQCMXbz2y5vOdZNej7yessFgYaQM/n3CvoM=;
        b=ne353ukwDghnGnW3HPOF/4PSgN+McoDbmkJm9FMzmrZDcFAD7EK2OapuoSm1g5mwfm
         I7RGL8DSO0iiq8skp4G3D8VJa+P5pdxQiHs25XFQ0gU70ulS8KccYJeOZG17GqXdSvnW
         tOC+ubr92jCsHTSnYA5KMEXVmlUlHHzkcV4qfD9TuJUiusF+FyMTgZFUZ8/RXbOVfeok
         XMDRgP3h+K/GxxW0pN+8nzDDQIQI3knLJVI31mXFW56MLkoQNlW7j9TUhEURlp7DwDzD
         uRYGhhczkt3Fyrb5VDWqbH+ng5lcEYDCgGzbR/tZQZJPYECC4L4pNmauVOrVioyu6h3N
         THkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
         :references:mime-version;
        bh=KLD+MloItQCMXbz2y5vOdZNej7yessFgYaQM/n3CvoM=;
        b=wOTCCf1CCMcPR9dWsv5bBG4zEKEC0pIuivuzF8ul6DK9p5Ox1jtH/M34zRhfBhk4w3
         24q6zOPGguiRzYm2gHUVeyT9ntnjN/LcCVrDqzwxwRx0g0cGHHl516dgqAXLUB1xRMAE
         aAV/QRJeo3ziudHRlR7+9SVtHw0oagKpZmEnnNKxL+tdAYNFwMolhtXtT2mQnxgX95fW
         vv+fZi3DoZHYnY2f3VATm8XmdzpObm9gJ0C0RhqSD6smSGQOAZIf0ZOBIp/mhlZ+GYyn
         2OH2H2B2Fhz0i7LV1LHDyf03kCrsZl2WKg18VKKAHDO9jx1idQSDDbdtjGHezIxqxQDN
         wYXA==
X-Gm-Message-State: AOAM530N0VqjWbZZJTdhJq5S3RCXy5kRtErfMJymrYaATEOH0ZPR2VRH
        m41Hy57riOGn0dONagd1ydo=
X-Google-Smtp-Source: ABdhPJzuSq/MUQlGIOzjU9G0ydbmSVmtEw8DKQdKcurbT9pZPqO7lteH/by5/VpQMde9PF0CTDn6ew==
X-Received: by 2002:a05:6512:3249:: with SMTP id c9mr20011630lfr.355.1642494813232;
        Tue, 18 Jan 2022 00:33:33 -0800 (PST)
Received: from eldfell ([194.136.85.206])
        by smtp.gmail.com with ESMTPSA id e23sm1617601lfj.64.2022.01.18.00.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jan 2022 00:33:32 -0800 (PST)
Date:   Tue, 18 Jan 2022 10:33:23 +0200
From:   Pekka Paalanen <ppaalanen@gmail.com>
To:     Sven Schnelle <svens@stackframe.org>
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Message-ID: <20220118103323.4bae3a7d@eldfell>
In-Reply-To: <87bl0amc6s.fsf@x1.stackframe.org>
References: <YeG8ydoJNWWkGrTb@ls3530>
        <c48ad8ae-aea5-43fa-882f-dccb90dde9a4@suse.de>
        <87bl0amc6s.fsf@x1.stackframe.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/pF3FTcxUDW+xdzSl3bV6P7H";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

--Sig_/pF3FTcxUDW+xdzSl3bV6P7H
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 17 Jan 2022 19:47:39 +0100
Sven Schnelle <svens@stackframe.org> wrote:

> I also tested the speed on my Thinkpad X1 with Intel graphics, and there
> a dmesg with 919 lines one the text console took about 2s to display. In
> x11, i measure 22ms. This might be unfair because encoding might be
> different, but i cannot confirm the 'memcpy' is faster than hardware
> blitting' point. I think if that would be the case, no-one would care
> about 2D acceleration.

I think that is an extremely unfair comparison, because a graphical
terminal app is not going to render every line of text streamed to it.
It probably renders only the final view alone if you simply run
'dmesg', skipping the first 800-900 lines completely.

Maybe fbcon should do the same when presented with a flood of text,
but I don't know how or why it works like it works. I assume in your
two second test you actually see some scrolling (animation) rather than
the final view? Or does it take 2 seconds just to update one screenful?

I doubt your fbcon and terminal window had height of 919 lines?


Thanks,
pq

--Sig_/pF3FTcxUDW+xdzSl3bV6P7H
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmHme1MACgkQI1/ltBGq
qqdM2w//ZKh892gl5oVmYmmIi7+I4zQlFkWyR0zVRmm2TIInv/MNdEJglce4PXNX
bfkq5wWZxDrtN/dm/uO165wehDzq4vn5WqhJPUckfmYvQyhCu959hDfPuqD6MZhA
3FMmW44k5NkkSVA0Y9wlhD2s5Xt3SGPkabMuxLsLCFLHsHodW6wRdf3Ot/3TdN+0
x7VK4M5KkBw74t2nGZpCd/Q+B1BlI9nrp7hpSwvqN1DYYH9+LCIrXrueKlA4Bkcz
a/NxfH7M0eXUJiuMv25gyfdGGQrPwdd1poGMdF7UiAOgxXXUb/zWM6b5tZS4POLM
9le017M5ZXMDVqp83XU1hukMAvt9O9QRwp+9C6CV/GD2II2rrKe74Fpvx4/CAycr
vAaKrRSvH1qKZ+kLnITGHnSyqFIT3QkousXWd/3Ty656p5Q62IYOnM1TEy9Sb3xE
5AIgB2wGUdjCl/lMn8DhTGFaTe/8rvTee9N1bqMVASfEyk63mVZHHb/1pcwSvspo
NGh+6H9yHUF3X1yH+jYQVFELe+1w7KXdF24mUOvhJwcoNqcN+nrpm3UYPs3Q4DpN
3lj+dzyUDg1esOBx3Q5DcwNcOXzJPE3h8EUN7+LKkIsr8Z7rFyQNM+y/7TfkK29O
KVrUmyBJKoytMrLdbv411j1K/4vVi00byMtSxUiKcLY0hv9EblE=
=Y0Ho
-----END PGP SIGNATURE-----

--Sig_/pF3FTcxUDW+xdzSl3bV6P7H--
