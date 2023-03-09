Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5601A6B27BC
	for <lists+linux-fbdev@lfdr.de>; Thu,  9 Mar 2023 15:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232056AbjCIOv2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 9 Mar 2023 09:51:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbjCIOvL (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 9 Mar 2023 09:51:11 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5277F4B62
        for <linux-fbdev@vger.kernel.org>; Thu,  9 Mar 2023 06:49:35 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id i9so2607506lfc.6
        for <linux-fbdev@vger.kernel.org>; Thu, 09 Mar 2023 06:49:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678373360;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6IEW8M/aeCm2sE5fVkmadnoct+8r+q1Vjruu3SWPyz4=;
        b=JDGWw6n/bGtww37vqF5bJEUF5OLuzOGZoRY3GeMOF0jknYjbBC4WV51Qe3htdU4oB4
         KaLBMDzhCwVC1vD/kxoF9lGJUtnE5u9RZAARdJu54kZLN4L7lguTv5XkyzR4DIMedS5Q
         Ap20WlP9mnwSWYVuPLalJo9WTO8CD9m7xL5G6OGu3zbvNlbJwxJObleGQzMx0LQj1lnL
         mvtoBMcRwu9mXunuhwdrZmg/Pl6oyYiRpOrBKxM9rnpXgsVVsaNAd54Er485w13aFkM6
         56iKRoSCedVc1svUs20og8E0aK1MCoF4yv96W21egG58IzZlEz+8oE3O1mJuBR1QQJVN
         +L5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678373360;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6IEW8M/aeCm2sE5fVkmadnoct+8r+q1Vjruu3SWPyz4=;
        b=zhXDkEajst1ExwYYiSXL8mIyNmjZrJ13Sl6HRd1cHQAr/1HO+/r+kvg3REvW7h+XNK
         DzuenVne3wsL0lPZ6IU9QFq0zONvSEoqo9FydzvXLYhs54eWT5A4ZloiV3Yw6Aw7Ik95
         2V0efQ19jAFu+a/a1FzoW4O73/E7Dr5ZKql8uOQMLohEWH3nAunBgjlqji7g3GU7kX5m
         zm5m4Nsm97GPm/H468WTPFaxFPvngfQigDJJS7ZXvsAFFg/oKBxFwYuLVWTgHVIE02oX
         XqZ4ed1OzsJWpz1PFYkUdpvcBbVNMqtx1GcGXRUzlevq8oitrJPg6UWHFaS9D1zLdufq
         Vj/A==
X-Gm-Message-State: AO0yUKXlqmevsZb3LTB53coMepS106ToFTz3A9oBopWedKrUqfPCb0fW
        Kxq5JHLLq+3c/f9OZaIp0DWWBI2nXaa39Pw86VM=
X-Google-Smtp-Source: AK7set+JGAQzKxmezNd7RQx8YEGiJc1RmAtTo+6cEJpQm6vgJINCoqE/RuqNP6OEM0zj+lk2yqH0G8QsAxMhcjQgxSI=
X-Received: by 2002:a05:6512:281f:b0:4db:1e7d:5d42 with SMTP id
 cf31-20020a056512281f00b004db1e7d5d42mr12673495lfb.0.1678373359921; Thu, 09
 Mar 2023 06:49:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6022:9116:b0:3a:4b9f:4650 with HTTP; Thu, 9 Mar 2023
 06:49:19 -0800 (PST)
Reply-To: wormer.amos@aol.com
From:   Wormer Amos <devynurmalayousef01@gmail.com>
Date:   Thu, 9 Mar 2023 15:49:19 +0100
Message-ID: <CAApZ1XwamMYRdqTQ8KLsA3my=iG4wuCoyrDWKFTX791BLZNPbQ@mail.gmail.com>
Subject: CAN I KNOW MORE ABOUT YOU
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_80,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,SUBJ_ALL_CAPS,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:143 listed in]
        [list.dnswl.org]
        *  2.0 BAYES_80 BODY: Bayes spam probability is 80 to 95%
        *      [score: 0.8128]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [devynurmalayousef01[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.5 SUBJ_ALL_CAPS Subject is all capitals
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [devynurmalayousef01[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Dear how are you? Are you capable for investment in your country. i
need serious investment project with good background, kindly connect
me to discuss details immediately. i will appreciate you to contact me
on this email address Thanks and awaiting your quick response yours
Amos
