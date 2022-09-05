Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A58D25AD452
	for <lists+linux-fbdev@lfdr.de>; Mon,  5 Sep 2022 15:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238245AbiIENxn (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Mon, 5 Sep 2022 09:53:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237966AbiIENxh (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Mon, 5 Sep 2022 09:53:37 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB2D53014
        for <linux-fbdev@vger.kernel.org>; Mon,  5 Sep 2022 06:53:35 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id d189so10214072ybh.12
        for <linux-fbdev@vger.kernel.org>; Mon, 05 Sep 2022 06:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date;
        bh=kHvqhKfwkSYWgIBUppKUElAVHImwDcI/W0up7OF2SsA=;
        b=P4wufkFfwTe4GIW5KxhfI6fF/7MS82erB8MD8jCrrYqw7mgruXVEUcru6CsJqqVwnA
         hGNmIHP0k/5d3n1MI314esc3EDB3UzfoLXGkrOlNQro1xXy14KGLSdneQnVumv/Fh5zC
         8N1DxTveIZD7bTqFoiwwAP/eEmeCKIK5xo6K/Lja1ncZI8ob8HbyXuJSEM9d+/pPXwwK
         AQBMJkHOQ0MLYWW0YUsOLRIpEX0ftL5xygJDyB3ilsblMEo9RJA2lwasZYBDuPTPARw9
         voYZbYbeIwGnO/VgUQCtu2ZALoasNwwHs1r1bNAqTk4zmC90vYAlDOE2j5pqU3tHeGnB
         zspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date;
        bh=kHvqhKfwkSYWgIBUppKUElAVHImwDcI/W0up7OF2SsA=;
        b=o7+YreqDSNWw6xH1u44bfAIEO9ZLXiFKCQRO5BRJssrG2JUlw2DZO4qCI7n3+xxgFb
         ZVqoB8Ec/YI5Gq7n2dSrDRZSVdNkIclBvGhRAnjpjKKph3YDb8BjDCMbBgIJ+ruYB2zW
         Bm+j1WM8R+MbzAx0pCnDqpbMM9ERIo5K7BHGszUv05dBR44TrZ0yVrJeP8FkOfDPh/m4
         yXaJi5q7Rz57NWRnd+5/8W7GmwGN+sqjqeRLb2wphxFIaIIl5NS6weq17TwxW+jM4ssZ
         uc7YeeBmeR2hB9YQUnRdzO8DStsgOKF4YHL3lqLO/ajL7D+S1PuoRpNRE0HWmfz9iMAQ
         zCSw==
X-Gm-Message-State: ACgBeo2eO2/GZ4485ugieQEG9VpEeqrWNjw4eoQKhOTMw01d/TQproiZ
        1VoiLvIKcXK6zDLKDC3gwqZbSzhqcDq9BX3iXBw=
X-Google-Smtp-Source: AA6agR6yWk9hc1ICxXLrPwNJ7V+solniJ3e381XQtRi1b7VGrdWfJCwgeaHta2ceY8/NDxXWl/STRe9j/vyesAG5AOA=
X-Received: by 2002:a05:6902:709:b0:6a9:23cc:76df with SMTP id
 k9-20020a056902070900b006a923cc76dfmr4179578ybt.136.1662386014828; Mon, 05
 Sep 2022 06:53:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:188f:0:0:0:0 with HTTP; Mon, 5 Sep 2022 06:53:34
 -0700 (PDT)
Reply-To: peterwhite202101@gmail.com
From:   Peter White <peterwhite10125@gmail.com>
Date:   Mon, 5 Sep 2022 13:53:34 +0000
Message-ID: <CA+01_CS4bcPR6u3+59e7P7x5SW8y9m_e9pTk1i66Oaur5wzxzQ@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b2a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5080]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [peterwhite202101[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [peterwhite10125[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [peterwhite10125[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Greetings from here.

I want to know if this email address is still valid to write to you.
There is something important I would like to discuss with you.

Thank you

Mr. Peter White
