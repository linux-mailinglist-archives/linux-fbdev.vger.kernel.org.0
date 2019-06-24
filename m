Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CAC250E41
	for <lists+linux-fbdev@lfdr.de>; Mon, 24 Jun 2019 16:34:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbfFXOeA (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 24 Jun 2019 10:34:00 -0400
Received: from mail-lj1-f174.google.com ([209.85.208.174]:41876 "EHLO
        mail-lj1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728055AbfFXOd7 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Mon, 24 Jun 2019 10:33:59 -0400
Received: by mail-lj1-f174.google.com with SMTP id 205so4049456ljj.8
        for <linux-fbdev@vger.kernel.org>; Mon, 24 Jun 2019 07:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=xSpymy4ZTK3msmD6QPXvPjkGa6ZhkmzkIxcVPzCGxpI=;
        b=QGTO8c3QN8+3nJ6ZPj+Co29LncuwH5Pfy5MFId62l5peJ/SHD77xx3rMtVzaB215am
         3i9WCFgoKaANXH6XMQR98/9yOErBSz905NJJAXz9qpTOI+SGEYqj5tYWGng1bfc2KrlK
         X/5GQELHNdCn1STMy2HVrsQZ62WwRfQGB60OH8RCpJ6Hy7TBF3ldDOVmjNBsP50K/MmG
         mgJR6QJuvL7NCuA/oLJFGFpaBXyMbldfP6ujSbrSwOmONUMTGmKmVrif8VTdSGFLxs4i
         lh9k0E/T4p0VsGblCBpFymIwi4KmIWGO1n65TCPkGAWhsQ7VFvn3ONQb425FYCZSdSco
         60BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=xSpymy4ZTK3msmD6QPXvPjkGa6ZhkmzkIxcVPzCGxpI=;
        b=hQ/nv827yIyegOAPhUH8PXHZf13S7mrHIcKi/YQdx91ytLzWSYM04Ipnpqb8oXp7yD
         goQUIcE8xLTI9ghwhHwTuiV5O/9Kw0o1AyPyqT7K7VVucm7Y8SXK56UJtRxtRgoRPh9G
         hScDxofxd3AvvxxbtfJSOVXPyfIF0B5WrcEncP0VvocKtpNr1kVlo5C9+sK/lbuyu/5/
         4BUPFXOmnj6CWSUBdxv/x8CQou3frW0eugOAEauuDAfnQn0XZgddQjaMbKyDfSgK38h6
         eHEtn03ji0KvLYI0r0fBplJ6SExqinFOox00vYb2KVVKthbMK6Pma4KT+Y6GL4YLKM5O
         SYRQ==
X-Gm-Message-State: APjAAAXJTe15NuUDQI29pAlqxLzsIvP42o/iqrf4K6ZRUwRS/KXXrir1
        PB1zK+uKQQtMrE3a1SSdwWQJtLXRCs3t3+0QMAL2KOIOwG4=
X-Google-Smtp-Source: APXvYqxgEoRCCUwjmyBPx8cyo6SjzC60gWjKCFHo8krOv2Gjgbm/gjLukqSZ5U9yaRATAlgviRnLFhzowi29ughduYU=
X-Received: by 2002:a2e:81d8:: with SMTP id s24mr30054331ljg.37.1561386838014;
 Mon, 24 Jun 2019 07:33:58 -0700 (PDT)
MIME-Version: 1.0
From:   =?UTF-8?Q?Ricardo_B=C3=A1nffy?= <rbanffy@gmail.com>
Date:   Mon, 24 Jun 2019 15:33:47 +0100
Message-ID: <CA+NZatLi=KdC+BnNz8egzDinGv+g9zYMPfn2yyKkFC40fnP5qQ@mail.gmail.com>
Subject: Character attributes in fb console
To:     linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-fbdev-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi foilks,

I'm starting to look into the fb console code and I have a couple questions=
:

- Is this the right list to ask questions about architecture and features?
- Do we have a roadmap of things we want to add/remove/refactor?
- Is there a comprehensive set of documents about the API,
architecture and expected behavior?

I guess I am looking for a developer getting started path.

Cheers,

Ricardo

--
Ricardo B=C3=A1nffy
http://about.me/rbanffy
