Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 290B32426E9
	for <lists+linux-fbdev@lfdr.de>; Wed, 12 Aug 2020 10:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbgHLIrg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Wed, 12 Aug 2020 04:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726565AbgHLIrg (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Wed, 12 Aug 2020 04:47:36 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6777C06174A
        for <linux-fbdev@vger.kernel.org>; Wed, 12 Aug 2020 01:47:35 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id a15so1231067wrh.10
        for <linux-fbdev@vger.kernel.org>; Wed, 12 Aug 2020 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=UOr65DEC+2TW/zt7uOWWliltVKZ89UsSxVAE/jQE1oM=;
        b=XMAE3LvcvzCJAob6NcGTn9jiXWpcvifTT9jE4thYqTL7fH3KMg5i22SvHBZ5rBCAEH
         Oq+O5uM5LD+EKYUwON1FvgTjL7kRot3OJSZqtEVaXq86JzR31D7chXH3fNuRzh3EnO7Q
         AXz/mxwlzPsDrzE74UVnGgcx4KiVWR11R4pcDJ8x4P0f3754UgtSUgFv2hCMYiZjvG0i
         15GxPHqyRXx0ux+vTdgZIyU3v7J4SSlVLgBs4/iYv2BcGw+rOhd3r7A9c5YUhoux1hCK
         o0CmM8mZ3lY965rrQeHzD2WH03jcUnrN/2t/Dxkrc4gW1fb4SOdZYf+ZFr6t8+vVXWtP
         zWYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=UOr65DEC+2TW/zt7uOWWliltVKZ89UsSxVAE/jQE1oM=;
        b=bD5UU6W85ZEfVcknYc1EbYjTCzal6yjfC/cIWcPeahSUj7j1wGc0J8scIAmueyZ3pl
         jTEkXEmfOHUcevJx/I2Q8KZHM6cur6wcq08xvBIGj/dyuIR1gBSo0CsVwftG0wXzOFKP
         YW9dzKny+YtL4+no6rp8JVNa3cugawYONu53okuOLut33DLOck9nNx+JNHdntYb+2sLs
         4iTFntDLQKx/8niXtyGBcDT2XNXoekRDtyuaU2p63JzF6js4kNo+8qx+ZuUDuzqWg9gd
         /dW/CiISfHvUa9F/sN+aJ2M3p6aIssFFAqxJy4y/WwuW2uOZXo9PxEdZBdTzl9C3ZKhd
         9pPg==
X-Gm-Message-State: AOAM530SZwAE7eT5PgxoKQwlakVRwm12tZt17qRZuR+VfVNAem7NLQ+W
        Wa78F64y4lCdtBZYzOjXswlyc4dLTtLwfr94KgA=
X-Google-Smtp-Source: ABdhPJwZaM17y/qY0kEjv7RBdQ5fdQWDCuePpvfvAV2Z3CLv9+jBMcmLuCqEP+aHHxZ+bW4NfB75YNo58nXFEJt/OrM=
X-Received: by 2002:a5d:4dd0:: with SMTP id f16mr32294052wru.408.1597222054532;
 Wed, 12 Aug 2020 01:47:34 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mrahmedmuzashah@gmail.com
Received: by 2002:adf:f781:0:0:0:0:0 with HTTP; Wed, 12 Aug 2020 01:47:34
 -0700 (PDT)
From:   "Mr.Ahmed Muzashah" <ahmedmuzashah@gmail.com>
Date:   Wed, 12 Aug 2020 09:47:34 +0100
X-Google-Sender-Auth: Bz_XzglcE4dsh9po3wI9XD9QHlI
Message-ID: <CALf1eZM-eHDBcV_QLa=peu0a0bJNMr1rMZX4r8DeO7vrSz2o4A@mail.gmail.com>
Subject: =?UTF-8?B?U2Now7ZuZW4gVGFn?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Sch=C3=B6nen Tag,

Bitte entschuldigen Sie, dass Sie einen =C3=9Cberraschungsbrief geschrieben
haben. Ich bin Herr Ahmed Muzashah, Account Manager bei einer
Investmentbank hier in Burkina Faso. Ich habe ein sehr wichtiges
Gesch=C3=A4ft, das ich mit Ihnen besprechen m=C3=B6chte. In meinem Konto is=
t ein
Kontoentwurf er=C3=B6ffnet Ich habe die M=C3=B6glichkeit, den verbleibenden
Fonds (15,8 Millionen US-Dollar) von f=C3=BCnfzehn Millionen
achthunderttausend US-Dollar eines meiner Bankkunden zu =C3=BCbertragen,
der beim Zusammenbruch der Welt gestorben ist Handelszentrum in den
Vereinigten Staaten am 11. September 2001.

Ich m=C3=B6chte diese Mittel investieren und Sie unserer Bank f=C3=BCr dies=
en
Deal vorstellen. Alles, was ich ben=C3=B6tige, ist Ihre ehrliche
Zusammenarbeit und ich garantiere Ihnen, dass dies unter einer
legitimen Vereinbarung durchgef=C3=BChrt wird, die uns vor
Gesetzesverst=C3=B6=C3=9Fen sch=C3=BCtzt Ich bin damit einverstanden, dass =
40% dieses
Geldes f=C3=BCr Sie als meinen ausl=C3=A4ndischen Partner, 50% f=C3=BCr mic=
h und 10%
f=C3=BCr die Schaffung der Grundlage f=C3=BCr die weniger Privilegien in Ih=
rem
Land bestimmt sind. Wenn Sie wirklich an meinem Vorschlag interessiert
sind, werden weitere Einzelheiten der =C3=9Cbertragung ber=C3=BCcksichtigt =
Sie
werden an Sie weitergeleitet, sobald ich Ihre Bereitschaftsmail f=C3=BCr
eine erfolgreiche =C3=9Cberweisung erhalte.

Dein,
Mr.Ahmed Muzashah,
