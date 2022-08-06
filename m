Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFC3458B551
	for <lists+linux-fbdev@lfdr.de>; Sat,  6 Aug 2022 14:06:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231296AbiHFMGt (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 6 Aug 2022 08:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbiHFMGt (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Sat, 6 Aug 2022 08:06:49 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C8FBE33
        for <linux-fbdev@vger.kernel.org>; Sat,  6 Aug 2022 05:06:46 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id k12so7381805ybk.6
        for <linux-fbdev@vger.kernel.org>; Sat, 06 Aug 2022 05:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=2ER2WW01ET2wH1WV2jGlyhputEhjwKA2tNpxchjmONE=;
        b=K/hL0OKR4t9R4c852ucTt6XoUxDMugTeeHaQBMbrgXND1A+PeUlDrDHjtog4xqsqD5
         BUiK74ydJ1PiAwd0R8s5nFYFc69DREZjdWWheL3CmMiNOv8N+qTBDU2Pnp6NIMCgfnch
         LkIA65VXVdl4nlsLP3FUXj6bZJjKX7LP9FKLWOBct/3b6AYT3K34W3rmEi99SX9gT5/J
         Y7/TdzPIWN2mEMhvt99H53/SCS5jBHV1l2hwzxJev/ldaT0Ck4k3+8xSEJmgpklSv5l2
         66vu/LT44C4pyTmJ2ltQWjgD07wa35Q/SWUdn0geLemWB5fkKyBmX5FccZclV52OdaCd
         EEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=2ER2WW01ET2wH1WV2jGlyhputEhjwKA2tNpxchjmONE=;
        b=O5k6T0BzdmCGQdvc0Xg4430cY3Bl/WpHmWPxSzwn4s/vNoHsBnS+sZmV3YYK+08m/q
         yP4L0FvIQQkRW0IzmZ6kVsNGKu3U9L+m7rwWGcadOKFXpb2cnddN++NuPO+m7Z0SDs7Z
         0V0j/KuX1qB9jd2fKjUb8EDHsF+bRYpmj6JtmG/mrh9E1xKFHwto4wFCO2bc9r5tqKCF
         Ot0QsE/zcKbqx0k4CieAi+I8sDNvlWb1vm1i4ioELTOBpl04xWR5OWzTjaYP75hyC2Sn
         PNSp2FpX7VH00oIJhtYpqxbvXZ3lzMJvpXzjifhwTMlpUVcBGyOnMW44M8uSYxzmR3lr
         vEqQ==
X-Gm-Message-State: ACgBeo2ry6B2n6+b/nh3+tGCN406n0LxcJBGZFgsLqUnoiJ+v8X62Z/N
        rE3fuc7Twxl1Xs1M2KJDzEWBfiRtktIvPvxHLEA=
X-Google-Smtp-Source: AA6agR4A8acqcfwVKOHfoffkRYBGjT7WOBlNDrcfX9Qa3koTirWKJ9yfFVdw7+cbakpchkY25Av+7pYwYwCttSNDmmw=
X-Received: by 2002:a25:b708:0:b0:672:adcb:1ab8 with SMTP id
 t8-20020a25b708000000b00672adcb1ab8mr8398899ybj.605.1659787605935; Sat, 06
 Aug 2022 05:06:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:7021:b0:18d:6408:2f21 with HTTP; Sat, 6 Aug 2022
 05:06:45 -0700 (PDT)
Reply-To: Drlisawilliams919@gmail.com
From:   Drlisawilliams <grahamkhudori@gmail.com>
Date:   Sat, 6 Aug 2022 14:06:45 +0200
Message-ID: <CAOPDNSG7ULJ4ufnV7WrVOY5X+bEjFj4i_NhZ-bJ+kQZsR6bgEQ@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b33 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5001]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [grahamkhudori[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [drlisawilliams919[at]gmail.com]
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Hi Dear,

My name is Dr Lisa Williams from the United States.I am a French and
American nationality (dual) living in the U.S and sometimes in France
for Work Purpose.

I hope you consider my friend request. I will share some of my pics
and more details about myself when I get your response.

Thanks
With love
Lisa
