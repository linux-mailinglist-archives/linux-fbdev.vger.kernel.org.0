Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 270F4547465
	for <lists+linux-fbdev@lfdr.de>; Sat, 11 Jun 2022 13:48:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231578AbiFKLsU (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 11 Jun 2022 07:48:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbiFKLsS (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 11 Jun 2022 07:48:18 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53A3F56FAD
        for <linux-fbdev@vger.kernel.org>; Sat, 11 Jun 2022 04:48:17 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id f65so1479736pgc.7
        for <linux-fbdev@vger.kernel.org>; Sat, 11 Jun 2022 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=XbdOdn7uobFHsuN9XLMlNq65m3JV0c6v1jahkCkk1ss=;
        b=UvaIwvyQ4ZdHoblTiuRRXOZnkO1bZC9zJWB6UtSzqJKaJUUrdZUkLrSfRrFxMpFS1K
         SbeM1YHoA7BXA/6eQikO2Cved34bdIAPT3r6JwNuVzMcMbEpsasGWm0e3iYr+8NsoT6y
         /Ed8Ap/DVydu/UVK+ZBDWdoaepoh/43SlPtzz2HSC1sKPVrSE4g4V0OG8KgxtH5u+lxS
         hcrKr9LnSTVk+lOZywT89+HSo5WDSCHiGBSEt0cfdjZouvbGXQEqM+u+B/wVPCkcvtTL
         7FVorIWy9bthXyaFMo2WluTQlVJn+pRgNzGlO/uCOv0acP1/TuYumz5crxVKTQyW7P0Q
         OAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=XbdOdn7uobFHsuN9XLMlNq65m3JV0c6v1jahkCkk1ss=;
        b=Nj/6LpnxgO1m6jF54FG/5duTdDpMEAKwHlHjYRDNdGCogjuy7OwcDnJUUyCji3B4NY
         F2CuON5ML9uRFpmdNWjXRuePFjOPhbElb90u20h8AWNtkH3lxSyP0LZQWaH4Y9FaDlaG
         uxOVApS+DiB2nWGvRIgD8micdxgYJ9oP9s5BC5o+a2jDfWYtXs4HnoU3aMhuxbdAo5qz
         N9Odlglkgr2NF+xZKhgU/VPME42WZwNrRJHu71x2LWoiVWCxXA1s3lW4j46X9BZejH4o
         ZxVVF7bBZ95xJMjoKbqQo3ubduN6rZ7PuZWHx3+/emSlY3A6h5aSE02usGc75CrrHkBW
         g4kg==
X-Gm-Message-State: AOAM531SxMgj0ZGzgto25q7zV861psHb7OVm+v7HilbO/hiOKY8Ndu4A
        sDiOXD8uA4cOp1fxM2vTTRkZ6I/Z4AWdmJ0PWW0=
X-Google-Smtp-Source: ABdhPJzwRSmASWNb8Ugyf209EbrC1T+AbN+iRHPmzefuwRpSgCkBgYrhE4Pn5d8Mc3q5Owd/YSvmTs5WZmmWL04Df9c=
X-Received: by 2002:a05:6a00:2390:b0:51c:21e1:782 with SMTP id
 f16-20020a056a00239000b0051c21e10782mr30137029pfc.21.1654948096245; Sat, 11
 Jun 2022 04:48:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:d043:b0:84:2d19:269e with HTTP; Sat, 11 Jun 2022
 04:48:15 -0700 (PDT)
Reply-To: stefanopessina92@gmail.com
From:   stefano pessina <nicholasmbivii506@gmail.com>
Date:   Sat, 11 Jun 2022 04:48:15 -0700
Message-ID: <CAAVPN7h-rsBffsuFve4baEjOht30Hz-W5YOZVcBuSbEaFoxq0w@mail.gmail.com>
Subject: =?UTF-8?B?R2zDvGNrd3Vuc2No?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.4 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

--=20
Die Summe von 1.500.000,00 =E2=82=AC wurde Ihnen von STEFANO PESSINA
gespendet. Bitte kontaktieren Sie uns f=C3=BCr weitere Informationen per
stefanopessina92@gmail.com
