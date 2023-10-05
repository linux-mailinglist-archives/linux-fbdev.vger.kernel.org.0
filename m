Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2DF17BA655
	for <lists+linux-fbdev@lfdr.de>; Thu,  5 Oct 2023 18:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbjJEQdg (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 5 Oct 2023 12:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjJEQck (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>); Thu, 5 Oct 2023 12:32:40 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C048F6A69
        for <linux-fbdev@vger.kernel.org>; Wed,  4 Oct 2023 23:33:49 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id 98e67ed59e1d1-27761d85b31so407924a91.3
        for <linux-fbdev@vger.kernel.org>; Wed, 04 Oct 2023 23:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696487629; x=1697092429; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDhDL/MKOJx72wE4ws0rW0kHCd2v8ICXns9dB377ziY=;
        b=RjhOiDmHGZQnlFBpVA2UfRVuy/+NWg1eVFcjbHyVWPqrOt8liVKaNkdO07dEwAlCx5
         KsbBJLJeW8TTv+w+W7UParfhSZrrgDVx56nVZn/iN+XYnkwwAPnsIf+RRpM70aXWuYWn
         FUPKFECjINgz2C5/8/MNBecS7AMgjcykQpSifZlUxPsRUPStXZEwbbbNq8IsC7pRU49g
         2+LeLHwe/ywexTSAxRKNZ2wxrA56LM/C5wagjYoMxiKH3fm6wLI1mqz2ooAtawm3xyLO
         7MNH/4IkM0QimgkFuWavZCvKriWjMlA7mhVC9kHyL0HawvVF3vv7O7VR59nJdNqZl7TC
         SW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696487629; x=1697092429;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BDhDL/MKOJx72wE4ws0rW0kHCd2v8ICXns9dB377ziY=;
        b=HDYCh+MBU9P64h6haB8JBQ8XM1KIu04+YN+/O4CV6hohtFuhh7C4Ti41+d1rsg4jDE
         RQROjLtY7zI9F/Z6HNGy+y9n27IRkNrBXyYpvTNNiMfmnPN6Ygi7f1u69kbhCheQUC/8
         FqVGMjvxF79LBmXfjB1ZnM93Pm+CxePB4JYU2oi32ldvO9UvUNlYvaYvehkEOsmGlF2/
         mhY4uM4d/+UzJ11dHU26J4heFQf3V8fxjcexlj0A7qkb16DfdrXzKwNI53LCxHYt8i5i
         xYF87j+MsgOjHQ1pl0SfWClHiVsWnfPUAK6y61a72vArJhjgAULzuWC3pAARzPnnzNM3
         fysg==
X-Gm-Message-State: AOJu0YxIos9KYEzBGzhnfj+loscymu4GoiPq0TKrif2sunkcS5GWMrRp
        MO+N0Q28YJ7PJ30lgA5GHwwtBRbc56Zc4xHIRTw=
X-Google-Smtp-Source: AGHT+IFQuSfqhZjNX8TtyTEySdhZuJltn1DDT4wEKCR9hbwdFTfkNWYyuZi/rg79G3CVx0dlVHlGKjlyEIo14dN4GCI=
X-Received: by 2002:a17:90b:4a0c:b0:274:b4ce:7049 with SMTP id
 kk12-20020a17090b4a0c00b00274b4ce7049mr4175988pjb.34.1696487629180; Wed, 04
 Oct 2023 23:33:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:4b14:b0:4e3:a413:3bff with HTTP; Wed, 4 Oct 2023
 23:33:48 -0700 (PDT)
Reply-To: katerynamudrik@gmail.com
From:   kateryna mudrik <williamsdrtracy4@gmail.com>
Date:   Wed, 4 Oct 2023 23:33:48 -0700
Message-ID: <CAHWDgznGi_e+T1JdtTr-r+vXZCyB4cQWMcJfAztofQ1xiKLTZQ@mail.gmail.com>
Subject: Hello good day
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

Good day,
Please don't be offended by my unsolicited email. First of all, I
would like to introduce myself briefly, my name is Kateryna Mudrik I
come from Mariupol in Donetsk Oblast, Eastern Ukraine. We may have
been humiliated by the Russian invasion of Ukraine, but I still
believe that we Ukrainians can always be friends with good people like
you.
Now, time won't allow me to say much but I will tell you more about
myself when I get your response.
Thank you and waiting for your response.
With kind regards
