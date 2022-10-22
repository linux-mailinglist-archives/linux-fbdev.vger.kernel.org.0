Return-Path: <linux-fbdev-owner@vger.kernel.org>
X-Original-To: lists+linux-fbdev@lfdr.de
Delivered-To: lists+linux-fbdev@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 842DE608BBA
	for <lists+linux-fbdev@lfdr.de>; Sat, 22 Oct 2022 12:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiJVKjH (ORCPT <rfc822;lists+linux-fbdev@lfdr.de>);
        Sat, 22 Oct 2022 06:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbiJVKiy (ORCPT
        <rfc822;linux-fbdev@vger.kernel.org>);
        Sat, 22 Oct 2022 06:38:54 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA29A2EA95F
        for <linux-fbdev@vger.kernel.org>; Sat, 22 Oct 2022 02:56:32 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id g10so5870103oif.10
        for <linux-fbdev@vger.kernel.org>; Sat, 22 Oct 2022 02:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VaaSLAJ+hgNGNq49WyPsh3ndDLo+mnrYcswrOHpJSv8=;
        b=nNMBkCIwl/6gK+toGqNRGG/YLL0fF324bx1qaOH1y4x3OIjxLq/HHYoLEQ6DIXVMhZ
         yBP/JqjfeKgn2zVw2pvLxCg6MQgOccj9D0PS+BxibSDKUMZPqFuO1BH9rucwVtk0imfk
         Uf1JB6y6hh5nwSF4l3nIHzMcJeO23qzW5xyKvOUo02NXv/UxA+fb1xfQ7gd0wj97+Png
         rtJzhayXE1f7/T0HHp6tTaPH4f4DE9rtLLXyoMLmdIeuEqEwHYp6KAIXioE2APt9Vqok
         QcnzNnKCtevhk7rrd2+8KLFUz2JMtjuKTuyIwbz60pUc4RihSWynNyvtYnVRFpjOFC8v
         n2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:sender:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VaaSLAJ+hgNGNq49WyPsh3ndDLo+mnrYcswrOHpJSv8=;
        b=bqGoQOd8sm/L4zoYDgIoX5T587w2m4QTByZdqtStc8qchFefhBwyRxUZQyb4Acu8Na
         86CjmC9iaCRF50ZOFT4qvQo/esQ5WX4Dl1Or5jvE7ZH5xxkWD2I+gDAcvSptOEkr1/yH
         tate3d/1iRW7D6clGKNRdav+NMePS2TaVxkolfWPPFxIQInYLCfTjjv3EepCndnKsj5X
         mH6UdBDX8CErY4doK4j9AjB6p3W1wtqcW6qN2ykrk5V9zTMEJeOmg25jY90s/tcwdbGW
         odZmA6UvrQOOs+G+54Fpil2vgmRBAwAnvI2XKPONwN4G2YRP1oN+LihUbhuYNLVTqKro
         EKQA==
X-Gm-Message-State: ACrzQf1v61LHKFBlUbixz+T/TwtAxD2MuaifE6NlTZN/265+YGDMSPtP
        u1jLt9HziQ7JWLVgh5b28O03z9UJb5KOKNMf9iqPjvDHQEI=
X-Google-Smtp-Source: AMsMyM7DV/UQjMDmfWUDARQEST583xXUpUhZuwI6Yo6QWpU1NylqbjJLzURvxWrib8B1x1GiMXZKxXX9K7ug1XjFr6Y=
X-Received: by 2002:a05:6808:13d2:b0:355:1770:c6ef with SMTP id
 d18-20020a05680813d200b003551770c6efmr21666671oiw.284.1666427448022; Sat, 22
 Oct 2022 01:30:48 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mrs.susanelwoodhara17@gmail.com
Sender: mrs.arawayann01@gmail.com
Received: by 2002:a05:6838:aea5:0:0:0:0 with HTTP; Sat, 22 Oct 2022 01:30:47
 -0700 (PDT)
From:   Mrs Susan Elwood Hara <mrs.susanelwoodhara17@gmail.com>
Date:   Sat, 22 Oct 2022 08:30:47 +0000
X-Google-Sender-Auth: UfMdHY-IGn2vy7vhRxwr3_PMsYw
Message-ID: <CAAOf0OErkdBB+pkMfQKO+67_RwCPJjBUpQs9uCH=U1CN1QD5=w@mail.gmail.com>
Subject: GOD BLESS YOU AS YOU REPLY URGENTLY
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,T_HK_NAME_FM_MR_MRS,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-fbdev.vger.kernel.org>
X-Mailing-List: linux-fbdev@vger.kernel.org

GOD BLESS YOU AS YOU REPLY URGENTLY

 Hello Dear,
Greetings, I am contacting you regarding an important information i
have for you please reply to confirm your email address and for more
details Thanks
Regards
Mrs Susan Elwood Hara.
