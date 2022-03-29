Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBDED4EB5FE
	for <lists+linux-fbdev@lfdr.de>; Wed, 30 Mar 2022 00:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbiC2Wbw (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Tue, 29 Mar 2022 18:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237417AbiC2Wbu (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Tue, 29 Mar 2022 18:31:50 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE617DE11
        for <linux-fbdev@vger.kernel.org>; Tue, 29 Mar 2022 15:30:07 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id a3-20020a05600c348300b0038ce25c870dso141193wmq.1
        for <linux-fbdev@vger.kernel.org>; Tue, 29 Mar 2022 15:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:content-transfer-encoding
         :content-description:subject:to:from:date:reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=RRhKFVN/UV5l9yltKJWytauDlF8my1xgBquluHWvCZQf1nNk+XF1WkoVWE8ZDa6Zgd
         hUQEkGzke6RxBeaDxr/28kw+xv2Si5rWy2MYD6XpOlxp2/VOcWnMZBvIY7s5fYHASQmF
         gD/eAxvtjAF+QQgmpkFA2Tpf15hLaHpvEjaP36Y7szFFKmEsv0mYk+Zpdi9qk1vYpPbY
         kioHRBAeHhfenN4fDiNeInSUZ/j3g5RemHKh2utunb4yOVe69HNUpJdqnJPDB/UY9SMc
         uw5ow8e51er9BhjpfFf6l9CUQPPa0t5cEWtFW3PY3J3V8lWnJimOTQ73w+EZI2su5+1H
         RB7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:content-description:subject:to:from:date
         :reply-to;
        bh=+v//v9bV1cKxYYqp6E5HrJfuFydY/JXcjMGnmfr7lM0=;
        b=UZ+V7OnStxTniOezjDfpNlzhItECUMGw7qFVrrmBO09DfudxsrqR+qSzEym47PZIWu
         QrehcCwUOb4fjd68GAhQ9T6zlkeA6o5rVYWoZpKVCnYpfxUIek309auWj87r1DomImnL
         DHa1i9Dg+O4ASACu2uNT/GPEOQLpvEaG4s0eBgomGpHvPaSaI6TnvmEnxpebvCyEcqjC
         oa4l40wi8i4Qbm7CMOqc9OlgVv5gh8/Bqkdork+uosNKtr5sCgk0+YAMzfD+BSSCbdAO
         wUugeD4qznB19Zzwa3NDyIy3vP10NLusZtZP56X0Waz1TkOPmw3Zr9Vgk131F1mF1pAJ
         m67Q==
X-Gm-Message-State: AOAM530LmdKYmA3LZMcEPr0ZKHLlGlVr6oh4RPkFyrZiAPrhy6j/E11Y
        nOAChRdaufdzMvu0xbKjUIs=
X-Google-Smtp-Source: ABdhPJxbfj1Qv3PFbrWtVWur71RoFiKahoQQ61wz5sk0cVEQFOFL51YVWFhBrbR5AEiI2jwoeoWWcA==
X-Received: by 2002:a7b:c382:0:b0:388:2e76:49ed with SMTP id s2-20020a7bc382000000b003882e7649edmr1556361wmj.195.1648593005986;
        Tue, 29 Mar 2022 15:30:05 -0700 (PDT)
Received: from [172.20.10.4] ([102.91.4.187])
        by smtp.gmail.com with ESMTPSA id n18-20020a5d6612000000b00203fbd39059sm16005026wru.42.2022.03.29.15.30.01
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Mar 2022 15:30:05 -0700 (PDT)
Message-ID: <6243886d.1c69fb81.4d4fe.f2e4@mx.google.com>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Gefeliciteerd, er is geld aan je gedoneerd
To:     Recipients <adeboyejofolashade55@gmail.com>
From:   adeboyejofolashade55@gmail.com
Date:   Tue, 29 Mar 2022 23:29:55 +0100
Reply-To: mike.weirsky.foundation003@gmail.com
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,T_US_DOLLARS_3 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Beste begunstigde,

 Je hebt een liefdadigheidsdonatie van ($ 10.000.000,00) van Mr. Mike Weirs=
ky, een winnaar van een powerball-jackpotloterij van $ 273 miljoen.  Ik don=
eer aan 5 willekeurige personen als je deze e-mail ontvangt, dan is je e-ma=
il geselecteerd na een spin-ball. Ik heb vrijwillig besloten om het bedrag =
van $ 10 miljoen USD aan jou te doneren als een van de geselecteerde 5, om =
mijn winst te verifi=EBren
 =

  Vriendelijk antwoord op: mike.weirsky.foundation003@gmail.com
 Voor uw claim.
