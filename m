Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2461B7D8BFD
	for <lists+linux-fbdev@lfdr.de>; Fri, 27 Oct 2023 00:59:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232007AbjJZW75 (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Thu, 26 Oct 2023 18:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbjJZW74 (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Thu, 26 Oct 2023 18:59:56 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44649D47
        for <linux-fbdev@vger.kernel.org>; Thu, 26 Oct 2023 15:59:54 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-35743e88193so4590505ab.3
        for <linux-fbdev@vger.kernel.org>; Thu, 26 Oct 2023 15:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698361193; x=1698965993; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KeB/ZSHr6R6wT9r5elgpvYu0BvcBbmEWFK91KTfeu88=;
        b=emtqW9mAbgbn5AutW0pvhSTSzg90cNGAIjGJfjqpWb1Oblae0xF8NK3NjfxeKEysPf
         DgzcF7LGN3jVr5PZ0nKOJaxI8GFDbo0EQDVCTNatBhTnn7u0XMcWz2+xJGMNw0M/LIAC
         zMFKLuae2cT8T6ymIgesbBIkxO8LO7avktQ7eINs8pkW83R+XgkiDZxBHKSjpAiskpEO
         Mz22IppCu8etB4OOMqxP8OU7t+Iw/I/0FFSkgqjj4w9cmH58Md4F945BjpCZ38C1XArr
         AzFIpgHij4R56MOQcw89hGjjhnIDh7cHd4HobPbEeSDjx1sbgTyw4rCxr4BS7uY5cCfU
         JevA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698361193; x=1698965993;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KeB/ZSHr6R6wT9r5elgpvYu0BvcBbmEWFK91KTfeu88=;
        b=vuBMrbm+V7Ow6A9fzQwv5xrZVJGkn4+JFiEgWwVMZUiorZ+lA48qYU5DU4H+e6fEVW
         kY8vy7y8Ksb8BSM3wHSdVyfS3u+xKMD1QxXwbCRqK/2vzvKa1H/j6eoBhy5l8czrh7xA
         OS5/DJyv/6mYXuxlA09dyAkO843bZuoo5O3u4ivxP4MWHLkY86JU5zJ+MHeRfvadALh8
         DglYwFnkwwrDEHWFPXQLJbwKEqtQrpO3cwOXVscWwfKj/J1OxSjDnuVoMNyNzruOTmpM
         XzSnbpdfFuH9J44XyVrOngu6FUK5747qVrkMVWH2UxwPpDJiDJUdocij/KC6PU+OD5FO
         fZ/w==
X-Gm-Message-State: AOJu0Yz0efUsh09U1EWhOG+U9YcVPWzIUTwZ7udCyzHgjo4SjHNa2OHY
        Lotl0lnsAtViPU2deoIvK4OEAMdLIS9ZaM49g0s=
X-Google-Smtp-Source: AGHT+IHACwJpP6J1T1KU5IC0+YrksUZYRp1iFyJ7YZl9cJy5Dxyps0lQ6AMZ8zx321Mz6tuwKBw4ROCfJROjJL754EY=
X-Received: by 2002:a05:6e02:1689:b0:357:68ac:c440 with SMTP id
 f9-20020a056e02168900b0035768acc440mr1419094ila.7.1698361193550; Thu, 26 Oct
 2023 15:59:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a92:c10e:0:b0:357:6121:a444 with HTTP; Thu, 26 Oct 2023
 15:59:53 -0700 (PDT)
Reply-To: tchalimbenson@gmail.com
From:   Benson Tchalim <robertwilson.daniel221@gmail.com>
Date:   Thu, 26 Oct 2023 22:59:53 +0000
Message-ID: <CAFFQHMiKpUaiO3_he6PhbmnZBpcFock6dz8qvKfnpK+CeQAUYw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

-- 
Do you see my message and what was your response?
