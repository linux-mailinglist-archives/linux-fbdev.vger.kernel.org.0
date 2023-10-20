Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 044337D1955
	for <lists+linux-fbdev@lfdr.de>; Sat, 21 Oct 2023 00:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjJTWw2 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Fri, 20 Oct 2023 18:52:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbjJTWw1 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Fri, 20 Oct 2023 18:52:27 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38DB41A3
        for <linux-fbdev@vger.kernel.org>; Fri, 20 Oct 2023 15:52:26 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-57b5ef5b947so749253eaf.0
        for <linux-fbdev@vger.kernel.org>; Fri, 20 Oct 2023 15:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697842345; x=1698447145; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yuu2LnwrVChltM5hXO2qRpyS1f/5ZYqe8k43OYq/VaU=;
        b=hTQmk7/lnjT8p+UIWxjW7/EgWBi+FfizqHy8ZE3AHfZPRH42wRcuuUYGX1iTC4giwM
         WYyLRIFaVEL+FiS6ZIjhhIcBiM7p/cGaID5kQfNNeUdH/JXUyCxXfpIN1A80PvuJEGMt
         2Sc5w7qju1NqCu4h9JlXaOljTH0Xq7EhYrE6mv19OeeWmMMJs3p59f3x7UdFae6vnNgm
         UlnLXgv22JaICW2d4T7KQWAaUdHiJXb+gJaWB70eNHmuO8RHj3d0CgAb3rOkCKGgmLwv
         jFc3i1R/aAwaUXlTLOZEHghdfPSo2sLeKSNaIVVvxwCSlG8PPngJ94SkrXRPn2po3sMg
         WSJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697842345; x=1698447145;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yuu2LnwrVChltM5hXO2qRpyS1f/5ZYqe8k43OYq/VaU=;
        b=NP0z7aqDgc34fmUZTlMApn3T5GhuJYLD8DJhW51gC/g2eFn1ISyYJ/NOXMrJq2o+4U
         dAz7OD8AsTM+Y5mxu0uJ4fuMafBdd36D9U6c22+Rwx+ia/nmDfgOgfpZgs6v9Bwqriuy
         Bw74bdskqlHqkcAoho4sLBo3KVtCO+2hycK6em+zDgZtQYIWPdv8ZltiiVFYDUHLQ0lp
         SoDDW6xueJ3tTP/dIyTpInw2KgGMlnQewVi6bhcgIHGoAjlqvU84yIolNtQ+D12+ZNL8
         /R3LSnOKYhQFbjdFPZdEYauVWgOVCWOIoxM/i+jAeBM/e9oYSVanFH1lq9KWwDQBWI/P
         /4GA==
X-Gm-Message-State: AOJu0Yx44JtTnl5T+G9/YsFwKhnvor2HKv5OdNdokp4uS3WkT+uwBqDb
        r0KM7sxvAxOO/jUMqTblwWlJ74cj+PMn+44kmow=
X-Google-Smtp-Source: AGHT+IG4qK4UIE4LGSav/d7vvkT5nCMF4MdKFuefELvh+kN8sIBU8fbx1akXRbZlrDO7JT1OmA6N1OOXmU5Q6Phsx64=
X-Received: by 2002:a05:6358:418d:b0:168:ab50:b90b with SMTP id
 w13-20020a056358418d00b00168ab50b90bmr3683085rwc.17.1697842345499; Fri, 20
 Oct 2023 15:52:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:608c:b0:69:a266:169a with HTTP; Fri, 20 Oct 2023
 15:52:24 -0700 (PDT)
Reply-To: tchalimbenson@gmail.com
From:   Benson Tchalim <qaijio702@gmail.com>
Date:   Fri, 20 Oct 2023 22:52:24 +0000
Message-ID: <CAHhoKfTziJBAyfJZkW=638zW-CHo27sAyjRo7A74BU3z1HMRwQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6962]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:c2c listed in]
        [list.dnswl.org]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [qaijio702[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [qaijio702[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

-- 
I wrote you a message since then no response what happens?
